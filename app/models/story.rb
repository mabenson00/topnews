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
  scope :active, -> { where(is_active: true) }
  scope :ordered, -> { order(rank: :asc) }

  default_scope { ordered }
  # story keys from hacker_rank => ["by", "descendants", "id", "kids", "score", "time", "title", "type", "url"]
end
