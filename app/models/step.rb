# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  recipe_id   :integer          not null
#  description :text(65535)      not null
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = 手順
#
class Step < ApplicationRecord
  # モジュール


  # 定数


  # アクセサ


  # 関連
  belongs_to :recipe


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :recipe_id,   presence: true
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
