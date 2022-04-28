module Mutations
  class CreateUser < BaseMutation
    field :result, Boolean, null: false
    field :user, Types::UserType, null: false

    argument :nickname, String, required: true
    argument :email, String, required: true

    def resolve(nickname:, email:)
      user = User.create!(auth0_id: context[:auth0_id], nickname:, email:)

      { result: true, user: }
    end
  end
end
