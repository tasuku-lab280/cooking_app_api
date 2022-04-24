# frozen_string_literal: true

module Types
  class RecipeType < Types::BaseObject
    # デフォルト
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :image, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


    # 関連
    field :user, UserType, null: false


    # メソッド
    field :created_at_text, String, null: false
    field :like_count, Integer, null: false
    field :favorite_count, Integer, null: false
  end
end
