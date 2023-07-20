class StoriesController < ApplicationController
  def favorite
    story = Story.find(params[:id])
    current_user.favorite!(story)

    redirect_to root_path, notice: "Added to Favorites"
  end

  def unfavorite
    story = Story.find(params[:id])
    current_user.unfavorite!(story)

    redirect_to root_path, notice: "Removed From Favorites"
  end
end
