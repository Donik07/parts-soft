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
    UserPermit.new(current_user).permit(params.require(:user))
  end
end
