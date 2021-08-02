class CharactersController < ApplicationController

  before_action :require_signin
  # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
    if @character.save
      redirect_to @character, notice: "Successfully Created Character"
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to @character, notice: "Successfully Updated Character"
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    session[:character_id] = nil
    redirect_to characters_path, notice: "Successfully Deleted Character"
  end

  private

  def character_params
    params.require(:character).permit(:name, :user_id, :allegiance, :class_option, :level, :current_health, :age, :sex, :height, :weight, :body_type, :skin, :race_ethnicity, :eyes, :hair, :distinguishing_features, :outfit, :carries, :species, :family_type, :family_description, :occupation_type, :occupation_description, :backstory_type, :backstory_description, :likes, :dislikes, :hobby_type, :hobby_description, :habit_type, :habit_description, :fear_type, :fear_description, :quirk_type, :quirk_description, :base_athleticism, :base_coordination, :base_drive, :base_knowledge, :base_openness, :base_sociability, :base_stability, :base_destroy, :base_grip, :base_leap, :base_run, :base_throw, :base_balance, :base_evade, :base_maneuver, :base_sneak, :base_create, :base_endure, :base_regulate, :base_debate, :base_decipher, :base_diagnose, :base_infer, :base_recall, :base_improvise, :base_notice, :base_impress, :base_lead, :base_lie, :base_please, :base_empathize, :base_soothe, :base_specialties)
  end

end
