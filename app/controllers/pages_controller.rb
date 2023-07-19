class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @stories = Story.active.limit(20)
  end
end
