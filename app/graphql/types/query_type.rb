module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_user, Types::UserType, null: true
    def current_user
      context[:current_user]
    end

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :recipes, [Types::RecipeType], null: false do
      argument :keyword, String, required: false
      argument :category_ids, [String], required: false
    end
    def recipes(keyword:, category_ids:)
      recipes = Recipe.all
      if keyword.present?
        recipes = recipes.where(Recipe.arel_table[:name].matches("%#{keyword}%"))
      end
      if category_ids.present?
        recipes = recipes.joins(:categories).merge(Category.where(id: category_ids.map(&:to_i)))
      end
      recipes.order(created_at: :desc)
    end

    field :categories, [Types::CategoryType], null: false
    def categories
      Category.all
    end
  end
end
