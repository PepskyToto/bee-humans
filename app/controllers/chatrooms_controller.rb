class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @message = Message.all
    @chatrooms = Chatroom.where("helper_id = ? OR needer_id = ?", current_user.id, current_user.id)
  end

  def show
    @user = current_user
    @review = Review.new
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
      # Créez un message automatique après la création de la chatbox
      @message = @chatroom.messages.build(first_message: true, user: current_user, content: "Je souhaite vous rendre service!")
      #first_message: true, si first_message : partiel _firstmessage
      if @message.save
        redirect_to request_chatroom_path(@request.id, @chatroom)
      else
        render :back
      end
    else
      render :back
    end
  end

  def update
    @chatroom = Chatroom.find_by(id: params[:id])

    if params["valid"] == "true"
      @chatroom.status = 2
      @chatroom.save
    elsif params["valid"] == "false"
      @chatroom.status = 4
      @chatroom.save
    elsif params["done"] == "true"
      @chatroom.status = 3
      @chatroom.save
    elsif params["done"] == "false"
      @chatroom.status = 5
      @chatroom.save
    end
    if @chatroom.save
      redirect_to request_chatroom_path(@chatroom.id), notice: "chatroom updated successfully."
    else
      render :back
    end
  end
end
#status meaning
#1: chatbox initié et needer doit accepter ou refuser le service. ( user journey : bouton helper)
#2: le user a accepté , chatbox débloqué , le service est pending
#3: chatbox initié et helper doit accepter ou refuser le service. ( user journey : bouton needer)
#4: le user a refusé, chatbox bloqué.
#5: le user a accepté, mais le service n'a jamais été rendu.
#6: le user a été noté. 
#7: le needer a accepté le service pour un autre helper. la chatroom 7 existe toujours et 
# repasse en status 1 si l'autre helper n'a pas accepté le service (status 5)



#ajouter une colonne lu default false a model message
#Quand on rentre dans le show de chatroom , on récupère les messages envoyé par l'autre et on les passe en lu.
#dans le html, si User.requests.chatroom.messages.where(user_id: != current_user.id).find(read: :false) != 0, alors count +=1 
#dans le html, si count !=0, icone de messagerie devient rouge + rond avec @count.value dedans
#User.last.requests.last.chatroom.messages.last