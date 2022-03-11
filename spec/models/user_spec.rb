# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

#
# = 会員
#
require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do
    it '正常なインスタンスであること' do
      expect(@user.valid?).to eq(true)
    end

    it 'emailが空の時、falseになること' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end
