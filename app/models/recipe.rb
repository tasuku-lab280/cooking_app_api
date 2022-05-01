# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  status      :string(255)      default("public"), not null
#  name        :string(255)      not null
#  description :text(65535)      not null
#  picture     :string(255)      not null
#  reference   :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# = レシピ
#
class Recipe < ApplicationRecord
  # モジュール
  extend Enumerize
  enumerize :status, in: %i[public private], predicates: { prefix: true }, scope: true
  mount_uploader :picture, RecipePictureUploader
  include ActionView::Helpers::DateHelper


  # 定数


  # アクセサ


  # 関連
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :touches, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :recipe_categories, allow_destroy: true


  # 委譲


  # スコープ


  # フック


  # バリデーション
  validates :user_id,     presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :status,      presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validates :name,        presence: true,
                          length: { maximum: 255, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :description, presence: false,
                          length: { maximum: 1024, allow_blank: true }
                          # uniqueness: false
                          # format: false
  validates :picture,     presence: true
                          # length: { maximum: 255 }
                          # uniqueness: false
                          # format: false
  validate :check_has_recipe_categories


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド
  def created_at_text
    "#{time_ago_in_words(created_at)}前"
  end

  def like_count
    touches.with_kind(:like).count
  end

  def favorite_count
    touches.with_kind(:favorite).count
  end


  # メソッド(Private)
  private

  def check_has_recipe_categories
    valid_categories = recipe_categories.select(&:valid?).reject(&:marked_for_destruction?)

    if valid_categories.blank?
      errors.add(:recipe_categories, :blank)
    elsif valid_categories.length > 3
      errors.add(:recipe_categories, 'は3つ以下にしてください。')
    end
  end
end
