# == Schema Information
#
# Table name: stocks
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  name        :string(255)      not null
#  quantity    :string(255)      not null
#  expired_on  :date             not null
#  description :text(65535)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = 在庫
#
class Stock < ApplicationRecord
  # モジュール
  mount_uploader :image, StockImageUploader


  # 定数


  # アクセサ


  # 関連
  belongs_to :user


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :user_id,     presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :name,        presence: true,
                          length: { maximum: 255, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :quantity,    presence: true,
                          length: { maximum: 255, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :expired_on,  presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :description, presence: true,
                          length: { maximum: 1024, allow_blank: true }
                          # uniqueness: false
                          # format: false
  # validates :image,       presence: false
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
