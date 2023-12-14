class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update]

  def show
    @user = current_user
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
    params.require(:user).permit(:username, :email, :address, :description, :photo)
    # Ajoutez ici les autres attributs que vous souhaitez permettre de modifier
  end

  def check_user
    redirect_to(root_url) unless @user == current_user
end

end
