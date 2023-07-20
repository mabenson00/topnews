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
require 'rails_helper'

RSpec.describe User do
  describe "creating a new user" do
    let(:attrs) { { first_name: :foo, last_name: :bar, email: 'f@b.c', password: 'foobar123' } }

    it "has first, last, email" do
      expect { described_class.create!(attrs) }.to change(described_class, :count).by(1)
    end

    it "requires a password" do
      expect(described_class.new(attrs.except(:password))).to be_invalid
    end
  end
end
