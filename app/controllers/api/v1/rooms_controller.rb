module Api
  module V1
    class RoomsController < ApplicationController
      def index
        rooms = Room.all
        render json: {status: 'SUCCESS', message: 'Loaded Rooms', data: rooms}, status: :ok
      end

      def show
        rooms = Room.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Rooms', data: rooms}, status: :ok
      end

      def create
        room = Room.new(room_params)
        if room.save
          render json: {status: 'SUCCESS', message: 'Room Created', data: room}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Room Created Failed', data: room.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        room = Room.find(params[:id]).destroy
        render json: {status: 'SUCCESS', message: 'Rooms Deleted', data: room}, status: :ok
      end

      def update
        room = Room.find(params[:id])
        if room.update_attributes(room_params)
          render json: {status: 'SUCCESS', message: 'Room Updated', data: room}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Room Updated Failed', data: room.errors}, status: :unprocessable_entity
        end
      end

    end
  end
end