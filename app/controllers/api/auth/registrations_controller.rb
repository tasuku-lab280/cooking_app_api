class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # メソッド(Private)
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
end
