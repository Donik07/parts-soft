class UsersController < ApplicationController
  before_action :load_user

  def edit

  end

  def update
    @user.update(user_params)
  end

  protected

  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :api_token)
  end
end
