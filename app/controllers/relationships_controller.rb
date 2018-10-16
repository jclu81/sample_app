class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    room = Room.find(params[:room_id])
    current_user.book_room(room)
    redirect_to room
  end

  def destroy
    return_url = request.referer
    room = Relationship.find(params[:id]).room
    current_user.cancel_room(room)
    redirect_to return_url
  end
end
