class RequestsController < ApplicationController
  def index
    user_skills = current_user.skills
    @requests = Request.joins(:skill).where(skills: { id: user_skills }).distinct
    #@requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.address = current_user.address
    @request.date = Date.today
    #@skill = Skill.find(params[:request][:skill])
    @request.skill_id = params[:request][:skill]
    if @request.save
      redirect_to user_path(@request.user)

    else
      render :new
    end
  end

  private
  def request_params
    params.require(:request).permit(:description)
  end

end
