# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  title       :string(255)      not null
#  description :text(65535)      not null
#  image       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = レシピ
#
class Recipe < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  belongs_to :user
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :touches, dependent: :destroy
  has_many :comments, dependent: :destroy



  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :user_id,     presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :title,       presence: true,
                          length: { maximum: 255, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :description, presence: false,
                          length: { maximum: 1024, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :image,       presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
