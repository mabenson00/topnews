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
class Story < ApplicationRecord
  has_and_belongs_to_many :favorited_users, class_name: "User", join_table: :user_favorite_stories
end
