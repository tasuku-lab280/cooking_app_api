# frozen_string_literal: true

module Types
  class RecipeTagType < Types::BaseObject
    field :id, ID, null: false
    field :recipe_id, Integer, null: false
    field :tag_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
