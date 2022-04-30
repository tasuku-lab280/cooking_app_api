module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    argument :nickname, String, required: true
    argument :email, String, required: true

    def resolve(nickname:, email:)
      user = User.new(auth0_id: context[:auth0_id], nickname:, email:)

      if user.save
        { user: }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
