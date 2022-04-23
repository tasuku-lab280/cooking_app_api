# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  recipe_id  :integer          not null
#  user_id    :integer          not null
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#
# = コメント
#
class Comment < ApplicationRecord
  # モジュール


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
  validates :user_id,   presence: false
                        # length: { maximum: 255 }
                        # uniqueness: false
                        # format: false
  validates :body,      presence: false,
                        length: { maximum: 1024, allow_blank: true }
                        # uniqueness: false
                        # format: false


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド


  # メソッド(Private)
end
