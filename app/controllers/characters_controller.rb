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
    params.require(:character).permit(:name, :user_id)
  end

end
