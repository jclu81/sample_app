module Api
  module V1
    class UsersController < ApplicationController
      def index
        user = User.all
        render json: {status: 'SUCCESS', message: 'Loaded Users', data: user}, status: :ok
      end

      def show
        user = User.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Users', data: user}, status: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: {status: 'SUCCESS', message: 'User Created', data: user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User Created Failed', data: user.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id]).destroy
        render json: {status: 'SUCCESS', message: 'Users Deleted', data: user}, status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: {status: 'SUCCESS', message: 'User Updated', data: user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User Updated Failed', data: user.errors}, status: :unprocessable_entity
        end
      end


    end
  end
end