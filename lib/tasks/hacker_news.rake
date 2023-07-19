namespace :hacker_news do
  desc "get top stories from hacker news and save in the db"
  task top_stories: :environment do
    ids = []
    HackerNewsApiService.new.best_stories.each_with_index do |story_uuid, index|
      Story.find_or_create_by!(uuid: story_uuid, rank: index + 1)
      GetStoryDetailsJob.perform_async(story_uuid)
      ids << story_uuid
    end
    Story.where.not(uuid: ids).update_all(is_active: false)
  end
end
