class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @message = Message.all
    @chatrooms = Chatroom.where("helper_id = ? OR needer_id = ?", current_user.id, current_user.id)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    redirect_to :root unless current_user == @chatroom.helper || current_user == @chatroom.needer
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

  def authenticate_user!

  end
end
