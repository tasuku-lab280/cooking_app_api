# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  nickname   :string(255)      not null
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#
# = 会員
#
class User < ApplicationRecord
  # モジュール
  mount_uploader :image, UserImageUploader


  # 定数


  # アクセサ


  # 関連
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :active_follows, source: :followed, dependent: :destroy
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower, dependent: :destroy
  has_many :touches, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :stocks, dependent: :destroy


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :auth0_id,  presence: true,
                        # length: { maximum: 255 }
                        uniqueness: true
                        # format: false
  validates :email,     presence: true,
                        length: { maximum: 255 },
                        uniqueness: true,
                        # format: false
                        unless: -> { validation_context == :create }
  validates :nickname,  presence: true,
                        length: { maximum: 32, allow_blank: true },
                        # uniqueness: false
                        # format: false
                        unless: -> { validation_context == :create }
  # validates :image,     presence: false
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false


  # クラス変数


  # クラスメソッド
  def self.from_token_payload(payload)
    return if payload.blank?

    find_or_create_by!(auth0_id: payload['sub'])
  end


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
