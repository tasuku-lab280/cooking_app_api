# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#
# = タグ
#
class Category < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  has_many :recipe_categories, dependent: :destroy
  has_many :recipes, through: :recipe_categories


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :name,  presence: true,
                    length: { maximum: 255, allow_blank: true }
                    # uniqueness: false
                    # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
