# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  recipe_id  :integer          not null
#  name       :string(255)      not null
#  quantity   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#
# = 材料
#
class Ingredient < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  belongs_to :recipe


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :recipe_id, presence: true
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false
  validates :name,      presence: true,
                        length: { maximum: 255, allow_blank: true }
                        # uniqueness: false
                        # format: false
  validates :quantity,  presence: true,
                        length: { maximum: 255, allow_blank: true }
                        # uniqueness: false
                        # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
