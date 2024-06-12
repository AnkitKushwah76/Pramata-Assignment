class MessagesController < ApplicationController
  def create
    Message.create!(content: msg_params[:content], room_id: params[:room_id], user_id: current_user.id)
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end

end