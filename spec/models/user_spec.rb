# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string(255)      not null
#  encrypted_password :string(255)      default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#
# = 会員
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'バリデーション' do
    it '正常なインスタンスであること' do
      expect(user.valid?).to be(true)
    end

    it 'emailが空の時、falseになること' do
      user.email = ''
      expect(user.valid?).to be(false)
    end
  end
end
