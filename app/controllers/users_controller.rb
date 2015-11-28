class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end
end
