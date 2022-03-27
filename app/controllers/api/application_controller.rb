module Api
  class ApplicationController < ActionController::Api
    # モジュール
    include DeviseTokenAuth::Concerns::SetUserByToken
  end
end 
