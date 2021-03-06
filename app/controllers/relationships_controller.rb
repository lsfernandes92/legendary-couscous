class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user_to_follow = User.find(params[:followed_id])
    current_user.follow(user_to_follow)
    redirect_to user_to_follow
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
