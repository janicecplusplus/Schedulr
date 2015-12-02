class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.paginate(:page => params[:page])
    @user = User.find(current_user.id)
  end
end
