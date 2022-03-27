class Api::TestController < Api::ApplicationController
  def index
    render json: { message: 'Hello World!' }
  end
end
