  class SkillsController < ApplicationController
    before_action :set_skill, only: [:show, :edit, :update, :destroy]

    def index
      @skills = Skill.all
    end

    def show
    end

    def new
      @skill = Skill.new
    end

    def create
      @skill = Skill.new(skill_params)

      if @skill.save
        redirect_to skills_path, notice: 'Skill was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @skill.update(skill_params)
        redirect_to skills_path, notice: 'Skill was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @skill.destroy
      redirect_to skills_path, notice: 'Skill was successfully destroyed.'
    end

    private

    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:category)
    end
  end
