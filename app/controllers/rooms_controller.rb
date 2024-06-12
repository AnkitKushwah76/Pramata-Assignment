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
    @room = Room.create!(name: params["room"]["name"], user_ids: [current_user.id])
  end


  def add_people
  room = Room.find(params['id'])
  room.user_ids << current_user.id
  end


  private

  def get_room
    @all_users = User.where.not(id: current_user.id)
    @room = Room.new
  end
end
