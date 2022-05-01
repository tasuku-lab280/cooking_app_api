module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    argument :account_id, String, required: true
    argument :nickname, String, required: true

    def resolve(nickname:, account_id:)
      user = User.new(auth0_id: context[:auth0_id], account_id:, nickname:)

      if user.save
        { user: }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
