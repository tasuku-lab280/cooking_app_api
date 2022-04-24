module Mutations
  class UpdateUser < BaseMutation
    field :result, Boolean, null: false

    argument :nickname, String, required: true
    argument :email, String, required: true

    def resolve(nickname:, email:)
      context[:current_user].update!(nickname:, email:)

      { result: true }
    end
  end
end
