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
    @chatroom = Chatroom.new()
    @chatroom.helper_id = current_user.id
    @request = Request.find(params[:request_id])
    @chatroom.needer_id = @request.user_id
    @chatroom.request_id = @request.id
    @chatroom.status = 1
    if @chatroom.save
      redirect_to request_chatroom_path(@request.id, @chatroom)
    else
      render :back
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:request_id, :helper_id, :needer_id, )
  end

  def authenticate_user!

  end
end
