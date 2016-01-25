class UsersController < ApplicationController
  def index
    user = User.all
    render json: user.to_json
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
          json: user.errors.full_messages, status: :unprocessable_entity
        )
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user.to_json
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    # render json: user.to_json
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
