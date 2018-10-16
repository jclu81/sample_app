class RoomsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:new, :edit,
                                    :update, :create,
                                    :destroy]

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = Room.paginate(page: params[:page])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room created!"
      redirect_to rooms_url(@room)
    else
      render 'new'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Room updated!"
      redirect_to rooms_url(@room)
    else
      render 'edit'
    end
  end

  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room deleted"
    redirect_to rooms_url
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
