class ChatroomsController < ApplicationController

  def index
    @message = Message.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:request_id)
  end
end
