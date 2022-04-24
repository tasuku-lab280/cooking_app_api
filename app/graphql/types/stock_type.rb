# frozen_string_literal: true

module Types
  class StockType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :name, String, null: false
    field :quantity, String, null: false
    field :expired_on, GraphQL::Types::ISO8601Date, null: false
    field :description, String
    field :image, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
