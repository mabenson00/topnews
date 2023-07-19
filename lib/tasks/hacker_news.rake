namespace :hacker_news do
  desc "get top stories from hacker news and save in the db"
  task top_stories: :environment do
    HackerNewsApiService.new.best_stories.each do |story_uuid|
      Story.find_or_create_by!(uuid: story_uuid)
      GetStoryDetailsJob.perform_async(story_uuid)
    end
  end
end
