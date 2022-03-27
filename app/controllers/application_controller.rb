class ApplicationController < ActionController::Base
  # フック
  protect_from_forgery, if: -> { request.format.json? }
end
