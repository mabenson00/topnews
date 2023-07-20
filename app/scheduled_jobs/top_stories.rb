require "sidekiq-scheduler"

class TopStories
  include Sidekiq::Worker

  def perform
    ids = []
    Rails.logger.info("Getting top stories from Hacker News")
    HackerNewsApiService.new.top_story_uuids.each_with_index do |story_uuid, index|
      Story.find_or_create_by!(uuid: story_uuid).update!(is_active: true, rank: index + 1)

      # queue up a job to get the details of the story, and update the score
      GetStoryDetailsJob.perform_async(story_uuid)
      ids << story_uuid
    end
    # set all stories that are not in the top stories to inactive so they dont appear on the home page
    Story.where.not(uuid: ids).update_all(is_active: false)
  end
end
