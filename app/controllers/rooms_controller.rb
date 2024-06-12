class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_room

  def index
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @message = Message.new
    @messages = @single_room.messages

    render "index"
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def get_room
    @room = Room.new
  end
end
