class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create 
    @request = Request.new(request_params)
    @request.user = current_user
    @skill = Skill.find(params[:skill_id])
    @request.skill = @skill
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

end
