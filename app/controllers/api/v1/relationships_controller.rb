module Api
  module V1
    class RelationshipsController < ApplicationController
      def create
        user = User.find(params.require(:user_id))
        room = Room.find(params.require(:room_id))

        if user.has_room?(room)
          render json: {status: 'ERROR', message: 'Relationship Already Created'}, status: :unprocessable_entity
        else
          user.book_room(room);
          data = user.name + " books room: " + room.name;
          render json: {status: 'SUCCESS', message: 'Relationship Created', data: data}, status: :ok
        end
      end

      def destroy
        user = User.find(params[:user_id])
        room = Room.find(params[:room_id])
        if user.has_room?(room)
          user.cancel_room(room)
          render json: {status: 'SUCCESS', message: 'Relationship Deleted'}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Relationship Deleted Failed'}, status: :unprocessable_entity
        end
      end
    end
  end
end