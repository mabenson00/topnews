class PagesController < ApplicationController
  before_action :authenticate_user!
  STORY_LIMIT = 20
  MAX_STORY_LIMIT = 100
  MIN_STORY_LIMIT = 1
  def home
    @stories = Story.active.limit(limit)
  end

  private

  def valid_limit?
    limit_int = params[:limit].to_i
    return false unless params[:limit].present?
    return false unless MIN_STORY_LIMIT < limit_int && limit_int < MAX_STORY_LIMIT

    true
  end

  def limit
    valid_limit? ? params[:limit].to_i : STORY_LIMIT
  end
end
