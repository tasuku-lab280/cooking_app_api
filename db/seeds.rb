COUNT = 10
USER_IDS = [1, 2, 3].freeze
DUMMY_IMAGE = File.open(Rails.root.join('app/assets/images/no_image.png'))

# 会員
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    auth0_id: SecureRandom.base64(12),
    account_id: SecureRandom.base64(12),
    nickname: "会員#{num}",
    icon: DUMMY_IMAGE,
  }
end
User.create!(results)

# 材料
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    user_id: USER_IDS[i % 3],
    name: "サンプル材料名#{num}",
    quantity: "サンプル数量#{num}",
    expired_on: Time.current.since(num.days),
    description: "サンプル説明#{num}",
    picture: DUMMY_IMAGE,
  }
end
Ingredient.create!(results)

# カテゴリ
results = Array.new(COUNT) do |i|
  num = i + 1

  { name: "サンプルカテゴリ名#{num}" }
end
Category.create!(results)

# レシピ
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    user_id: USER_IDS[i % 3],
    status: :public,
    name: "サンプルレシピ名#{num}",
    description: "サンプル説明#{num}",
    picture: DUMMY_IMAGE,
    reference: "サンプル参考文献#{num}",
    recipe_categories_attributes: [{ category_id: num }],
  }
end
Recipe.create!(results)

DUMMY_IMAGE.close
