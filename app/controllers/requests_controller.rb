class RequestsController < ApplicationController
  def index
    user_skills = current_user.skills
    @requests = Request.joins(:skill).where(skills: { id: user_skills }).distinct

  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.address = current_user.address
    @request.date = Date.today
    @request.latitude = 0
    @request.longitude = 0
    if @request.save!
      redirect_to users_path
      #redirect_to user_path
    else
      render :back
    end
  end

  def update
    if params["triggered_by_needer"] # si on arrive dans la méthode update par la liste de helper
      params["request"]["user_ids"].each do |user_id| # pour chaque user_id fait
        @count = 0 # système de verification , utilisé en fin de méthode, pour s'assurer que il y a eu autant de chatroom créer que d'utilisateur coché
        @chatroom = Chatroom.new()
        @request = Request.find(params["id"])
        @chatroom.needer_id = current_user.id # current_user est le needer
        @chatroom.helper_id = user_id
        @chatroom.request_id = @request.id
        @chatroom.status = 3
        if @chatroom.save
          @count += 1
          @message = @chatroom.messages.build(first_message: true, user: current_user, content: "Je souhaite vous demander un service en #{Skill.find(@request.skill_id).category}!")
          @message.save
        end
      end
      if @message.save && count = params["request"]["user_ids"].length
        redirect_to chatrooms_path, notice: "Vous avez créé #{count} discussion"
      end
    end
  end

  private
  def request_params
    params.require(:request).permit(:description, :title, :skill_id)
  end

end
