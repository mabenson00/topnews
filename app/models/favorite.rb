class Favorite < ApplicationRecord
  self.table_name = "user_favorite_stories" # should just be favorites but dont want to redo migration

  belongs_to :user
  belongs_to :story
end
