class RequestsController < ApplicationController
  def index
    @requests = Request.all
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
      redirect_to requests_path
    else
      render :new
    end
  end

  private
  def request_params
    params.require(:request).permit(:description)
  end

end
