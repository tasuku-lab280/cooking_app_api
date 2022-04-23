COUNT = 10
USER_IDS = [1, 2, 3]
DUMMY_IMAGE = open("#{Rails.root}/app/assets/images/no_image.png")


# 会員
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    nickname:  "会員#{num}",
    email: "dev+user#{num}@example.com",
  }
end
User.create!(results)


# 在庫
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    user_id: USER_IDS[i % 3],
    name: "サンプル在庫名#{num}",
    quantity: "サンプル数量#{num}",
    expired_on: Time.current.since(num.days),
    description: "サンプル説明#{num}",
    image: DUMMY_IMAGE,
  }
end
Stock.create!(results)


# レシピ
results = Array.new(COUNT) do |i|
  num = i + 1

  {
    user_id: USER_IDS[i % 3],
    title: "サンプルレシピ名#{num}",
    description: "サンプル説明#{num}",
    image: DUMMY_IMAGE,
    recipe_tags_attributes: [{ tag_attributes: { name: "サンプルタグ名#{num}" } }],
    ingredients_attributes: [{ name: "サンプル材料名#{num}", quantity: "サンプル数量#{num}" }],
    steps_attributes: [{ description: "サンプル説明#{num}", image: DUMMY_IMAGE }],
  }
end
Recipe.create!(results)
