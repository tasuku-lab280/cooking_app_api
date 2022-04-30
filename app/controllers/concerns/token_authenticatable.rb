module TokenAuthenticatable
  extend ActiveSupport::Concern


  # メソッド
  def current_user
    @current_user ||= begin
      payload = auth_payload

      if payload.blank?
        nil
      else
        User.find_by(auth0_id: payload['sub'])
      end
    end
  end

  def auth0_id
    @auth0_id ||= auth_payload['sub']
  end


  # メソッド(Private)
  private

  def auth_payload
    auth_payload, = retrieve_auth_token
    auth_payload
  rescue JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordInvalid
    nil
  end

  def http_token
    request.headers['Authorization'].split.last if request.headers['Authorization'].present?
  end

  def retrieve_auth_token
    JsonWebToken.verify(http_token)
  end
end
