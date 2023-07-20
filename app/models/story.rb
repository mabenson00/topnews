# == Schema Information
#
# Table name: stories
#
#  id         :bigint           not null, primary key
#  is_active  :boolean          default(TRUE), not null
#  rank       :integer
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
  has_many :favorites

  scope :active, -> { where(is_active: true) }
  scope :ordered, -> { order(rank: :asc) }
  scope :recently_favorited, -> { joins(:favorites).group("stories.id").order("MAX(user_favorite_stories.created_at) DESC") }

  def favorite_count
    favorited_users.count
  end

  def last_favorited_time
    favorites.maximum(:created_at)
  end

  def favorited_by
    favorited_users.collect(&:full_name).join(", ")
  end
end
