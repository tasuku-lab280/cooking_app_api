class CreateCookingTables < ActiveRecord::Migration[7.0]
  def up
    # 会員
    create_table :users do |t|
      t.string :auth0_id, null: false
      t.string :email
      t.string :nickname
      t.string :image

      t.timestamps null: false
    end
    add_index :users, :auth0_id, unique: true
    add_index :users, :email,    unique: true

    # 在庫
    create_table :stocks do |t|
      t.integer :user_id,    null: false
      t.string  :name,       null: false
      t.string  :quantity,   null: false
      t.date    :expired_on, null: false
      t.text    :description
      t.string  :image

      t.timestamps null: false
    end
    add_index :stocks, :user_id

    # レシピ
    create_table :recipes do |t|
      t.integer :user_id,     null: false
      t.string  :title,       null: false
      t.text    :description, null: false
      t.string  :image,       null: false

      t.timestamps null: false
    end

    add_index :recipes, :user_id

    # 材料
    create_table :ingredients do |t|
      t.integer :recipe_id, null: false
      t.string  :name,      null: false
      t.string  :quantity,  null: false

      t.timestamps null: false
    end

    add_index :ingredients, :recipe_id

    # 手順
    create_table :steps do |t|
      t.integer :recipe_id,   null: false
      t.text    :description, null: false
      t.string  :image

      t.timestamps null: false
    end

    add_index :steps, :recipe_id

    # タグ
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    # レシピタグ
    create_table :recipe_tags do |t|
      t.integer :recipe_id, null: false
      t.integer :tag_id,    null: false

      t.timestamps null: false
    end
    add_index :recipe_tags, :recipe_id
    add_index :recipe_tags, :tag_id

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
    drop_table :stocks
    drop_table :recipes
    drop_table :ingredients
    drop_table :steps
    drop_table :tags
    drop_table :recipe_tags
    drop_table :touches
    drop_table :comments
    drop_table :follows
  end
end
