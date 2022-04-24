# == Schema Information
#
# Table name: touches
#
#  id         :bigint           not null, primary key
#  recipe_id  :integer          not null
#  user_id    :integer          not null
#  kind       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#
# = タッチ
#
class Touch < ApplicationRecord
  # モジュール
  extend Enumerize
  enumerize :kind, in: %i[like favorite], predicates: { prefix: true }, scope: true


  # 定数


  # アクセサ


  # 関連
  belongs_to :recipe
  belongs_to :user


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :recipe_id, presence: true
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false
  validates :user_id,   presence: true
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false
  validates :kind,      presence: true,
                        length: { maximum: 255 }
                        # uniqueness: false
                        # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
