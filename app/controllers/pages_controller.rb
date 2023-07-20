class PagesController < ApplicationController
  STORY_LIMIT = 20
  MAX_STORY_LIMIT = 100
  MIN_STORY_LIMIT = 1

  def home
    @top_stories = Story.active.ordered.limit(limit)
    @recently_favorited_stories = @favorited_stories = Story.recently_favorited
  end

  private

  def valid_limit?
    limit_int = params[:limit].to_i
    return false if params[:limit].blank?
    return false if limit_int < MIN_STORY_LIMIT || limit_int > MAX_STORY_LIMIT

    true
  end

  def limit
    valid_limit? ? params[:limit].to_i : STORY_LIMIT
  end
end
