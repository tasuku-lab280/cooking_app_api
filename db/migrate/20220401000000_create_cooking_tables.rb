class CreateCookingTables < ActiveRecord::Migration[7.0]
  def up
    # 会員
    create_table :users do |t|
      t.string :auth0_id,   null: false
      t.string :account_id, null: false
      t.string :nickname,   null: false
      t.string :icon

      t.timestamps null: false
    end
    add_index :users, :auth0_id,   unique: true
    add_index :users, :account_id, unique: true

    # 材料
    create_table :ingredients do |t|
      t.integer :user_id,    null: false
      t.string  :name,       null: false
      t.string  :quantity,   null: false
      t.date    :expired_on, null: false
      t.text    :description
      t.string  :picture

      t.timestamps null: false
    end
    add_index :ingredients, :user_id

    # レシピ
    create_table :recipes do |t|
      t.integer :user_id,     null: false
      t.string  :status,      null: false, default: :public
      t.string  :name,        null: false
      t.text    :description, null: false
      t.string  :picture,     null: false
      t.text    :reference

      t.timestamps null: false
    end

    add_index :recipes, :user_id

    # カテゴリ
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    # レシピカテゴリ
    create_table :recipe_categories do |t|
      t.integer :recipe_id,   null: false
      t.integer :category_id, null: false

      t.timestamps null: false
    end
    add_index :recipe_categories, :recipe_id
    add_index :recipe_categories, :category_id

    # タッチ
    create_table :touches do |t|
      t.integer :recipe_id, null: false
      t.integer :user_id,   null: false
      t.string  :kind,      null: false

      t.timestamps null: false
    end
    add_index :touches, :recipe_id
    add_index :touches, :user_id
    add_index :touches, %i[kind user_id], unique: true

    # コメント
    create_table :comments do |t|
      t.integer :recipe_id, null: false
      t.integer :user_id,   null: false
      t.text    :body,      null: false

      t.timestamps null: false
    end
    add_index :comments, :recipe_id
    add_index :comments, :user_id

    # フォロー
    create_table :follows do |t|
      t.integer :follower_id,       null: false
      t.integer :followed_id,       null: false

      t.timestamps null: false
    end
    add_index :follows, :follower_id
    add_index :follows, :followed_id
    add_index :follows, %i[follower_id followed_id], unique: true
  end

  def down
    drop_table :users
    drop_table :ingredients
    drop_table :recipes
    drop_table :categories
    drop_table :recipe_categories
    drop_table :touches
    drop_table :comments
    drop_table :follows
  end
end
