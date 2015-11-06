class FriendshipsController < ApplicationController
  def create
    puts "hi\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend!"
      redirect_to users_path
    else
      flash[:error] = "Unable to add friend :("
      redirect_to users_path
    end
  end
  def destroy
    @friendship = current_user.friendships.where(:friend_id => params[:friend_id])
    @friendship[0].destroy
    flash[:notice] = "Removed friendship :("
    redirect_to users_path
  end
end