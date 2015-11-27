class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @user = User.includes(:inverted_friendships, :inverted_friends, :friendships, :friends).find(current_user.id)
     fresh_when([User.all, current_user.groups, current_user.inverted_friendships, current_user.friendships])
  end
end
