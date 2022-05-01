# frozen_string_literal: true

module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :status, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :picture, String, null: false
    field :reference, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :categories, [Types::CategoryType], null: true

    field :created_at_text, String, null: false
    field :like_count, Integer, null: false
    field :favorite_count, Integer, null: false
  end
end
