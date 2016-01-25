class UsersController < ApplicationController
  def index
    user = User.all
    render json: user.to_json
  end

  def show
    render json: { 'a_key' => 'a_value' }
  end
end
