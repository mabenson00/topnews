# == Schema Information
#
# Table name: stories
#
#  id         :bigint           not null, primary key
#  score      :integer
#  time       :datetime
#  title      :string
#  url        :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GetStoryDetailsJob
  include Sidekiq::Job
  sidekiq_options retry: false # for testing

  def perform(story_uuid)
    details = HackerNewsApiService.new(id: story_uuid).details
    Rails.logger.info("Updating story #{story_uuid} with details #{details}")
    Story.find_by!(uuid: story_uuid).update!(score: details["score"] || 0, time: Time.zone.at(details["time"]), title: details["title"], url: details["url"])
    Rails.logger.info("Story #{story_uuid} updated")
  rescue ActiveRecord::RecordNotFound
    Rails.logger.error("Story #{story_uuid} not found")
  end
end
