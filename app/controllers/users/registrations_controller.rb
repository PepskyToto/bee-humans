# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    puts "Je suis dans le new"
    super
  end

  # POST /resource
  def create
    puts "Je suis dans le create..."
    super
    skills_ids = params[:user][:skill_ids] || []
    skills_ids.reject! { |id| id.empty? }
    p skills_ids
    if skills_ids.present? && resource.id.present?
      puts "ON AVANCE"
      skills_ids.each do |id|
        resource.skills << Skill.find(id)
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    skills_ids = params[:user][:skill_ids] || []
    skills_ids.reject! { |id| id.empty? }
    p skills_ids

    if skills_ids.present? && resource.id.present?
      resource.skills.clear
      skills_ids.each do |id|
        resource.skills << Skill.find(id)
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
