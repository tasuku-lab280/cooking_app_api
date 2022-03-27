class Api::TestController < ApplicationController
  def index
    render json: { message: 'Hello World!' }
  end
end
