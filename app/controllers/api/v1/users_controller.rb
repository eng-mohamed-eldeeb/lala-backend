class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session # to allow API requests without CSRF tokens


  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User created successfully", user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { message: "User updated successfully", user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "User deleted successfully" }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :img_url, :is_admin)
  end
end
