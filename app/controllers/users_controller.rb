class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update]
  before_action :mean, except: [:index]

  def  index
    @users = User.all
    skill_id = params[:skill_id]
    @request = Request.where(user_id: current_user.id).last
  end

  def mean 
    if Review.where(reviewee_id: @user.id) != []
      @reviews = Review.where(reviewee_id: @user.id)
      ratings = []
      @reviews.each do |review|
        ratings << review.rating
      end
      average_rating = ratings.sum / ratings.length.to_f
      @user.average_rating = average_rating.truncate(1)
      @user.save
    end
  end

  def show
    if params["triggered_by_index"]
      @user = User.find(params["id"])
      @reviews = Review.where(reviewee_id: @user.id)
      mean
    else
      @user = current_user
      @reviews = Review.where(reviewee_id: @user.id)
      mean
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Votre profil a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :address, :description, :photo, :skill_id)
    # Ajoutez ici les autres attributs que vous souhaitez permettre de modifier
  end

  def check_user
    redirect_to(root_url) unless @user == current_user
end

end
