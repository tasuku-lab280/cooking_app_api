module Mutations
  class CreateRecipe < BaseMutation
    field :errors, [String], null: true

    class Input < Types::BaseInputObject
      argument :status, String, required: true
      argument :name, String, required: true
      argument :description, String, required: true
      argument :picture, ApolloUploadServer::Upload, required: true
      argument :reference, String, required: false
      argument :category_ids, [String], required: true
    end
    argument :input, Input, required: true

    def resolve(input:)
      recipe = context[:current_user].recipes.build(
        status: input[:status],
        name: input[:name],
        description: input[:description],
        picture: input[:picture],
        reference: input[:reference],
        recipe_categories_attributes: input[:category_ids].map { |cid| { category_id: cid } },
      )

      if recipe.save
        {}
      else
        { errors: recipe.errors.full_messages }
      end
    end
  end
end
