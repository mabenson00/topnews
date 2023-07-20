# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # i shouldve made a new model "favorites" which would have a user_id and story_id
  has_and_belongs_to_many :favorited_stories, class_name: "Story", join_table: :user_favorite_stories
  has_many :favorites

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorite!(story)
    favorited_stories << story
    save!
  end

  def unfavorite!(story)
    favorited_stories.delete(story)
    save!
  end

  def favorited?(story)
    favorited_stories.include?(story)
  end
end
