class FriendshipsController < ApplicationController
  def create
    @request = Friendship.create(:user_id => current_user.id, :friend_id => params[:friend_id])
    if @request.save
      flash[:notice] = "Friend request sent!"
    else
      flash[:error] = "Unable to send request :("
    end
    redirect_to users_path
  end
  def update
    @request = Friendship.where(:friend_id => current_user.id, :user_id => params[:id]).first
    if @request.update_attributes(:confirmed => 1)
      flash[:notice] = "Confirmed friendship!"
      redirect_to users_path
    else
      flash[:error] = "Unable to confirm friendship :("
      redirect_to users_path
    end              
  end
  def destroy
    @friendship = current_user.friendships.where(:friend_id => params[:id])
    if (@friendship.length != 0)
      @friendship[0].destroy
    else
      current_user.inverted_friendships.where(:user_id => params[:id])[0].destroy
    end
    flash[:notice] = "Removed friendship :("
    redirect_to users_path
  end
end