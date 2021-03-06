# == Schema Information
#
# Table name: recipe_categories
#
#  id          :bigint           not null, primary key
#  recipe_id   :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = レシピカテゴリ
#
class RecipeCategory < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  belongs_to :recipe
  belongs_to :category


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :recipe,    presence: true
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false
  validates :category,  presence: true
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
