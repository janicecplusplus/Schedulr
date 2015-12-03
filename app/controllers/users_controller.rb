class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @otherUsers = User.where.not(id: User.find(current_user.id).friends).where.not(id: User.find(current_user.id).inverted_friends).where.not(id: current_user.id).paginate(:page => params[:page], :per_page => 9).order('username ASC')
    @user = User.includes(:inverted_friends, :friends).find(current_user.id)
  end
end
