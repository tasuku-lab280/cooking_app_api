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
  mount_uploader :image, RecipeImageUploader
  include ActionView::Helpers::DateHelper


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
  accepts_nested_attributes_for :recipe_tags, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true



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
  validate :check_has_ingredients
  validate :check_has_steps


  # クラス変数


  # クラスメソッド


  # クラスメソッド(Private)


  # メソッド
  def created_at_text
    time_ago_in_words(created_at) + '前'
  end

  def like_count
    touches.with_kind(:like).count
  end

  def favorite_count
    touches.with_kind(:favorite).count
  end


  # メソッド(Private)
  private

  def check_has_ingredients
    return if ingredients.select(&:valid?).reject(&:marked_for_destruction?).any?

    errors.add(:ingredients, :blank)
  end

  def check_has_steps
    return if steps.select(&:valid?).reject(&:marked_for_destruction?).any?

    errors.add(:steps, :blank)
  end
end
