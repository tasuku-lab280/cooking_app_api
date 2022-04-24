# == Schema Information
#
# Table name: follows
#
#  id          :bigint           not null, primary key
#  follower_id :integer          not null
#  followed_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = フォロー
#
class Follow < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :follower_id, presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :followed_id, presence: false
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
