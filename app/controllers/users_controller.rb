class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.paginate(:page => params[:page], :per_page => 12)
    @user = User.find(current_user.id)
  end
end
