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
FactoryBot.define do
  factory :story do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    score { rand(1000) }
    time { Time.current - rand(1000.minutes) }
    uuid { SecureRandom.uuid }
  end
end
