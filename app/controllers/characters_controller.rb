class CharactersController < ApplicationController

  before_action :require_signin

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @smart_stats = calculate_stats(@character)
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
    params.require(:character).permit(:name, :user_id, :image_url, :allegiance, :class_option, :level, :current_health, :age, :sex, :height, :weight, :body_type, :skin, :race_ethnicity, :eyes, :hair, :distinguishing_features, :outfit, :carries, :species, :family_type, :family_description, :occupation_type, :occupation_description, :backstory_type, :backstory_description, :likes, :dislikes, :hobby_type, :hobby_description, :habit_type, :habit_description, :fear_type, :fear_description, :quirk_type, :quirk_description, :base_athleticism, :base_coordination, :base_drive, :base_knowledge, :base_openness, :base_sociability, :base_stability, :base_destroy, :base_grip, :base_leap, :base_run, :base_throw, :base_balance, :base_evade, :base_maneuver, :base_sneak, :base_create, :base_endure, :base_regulate, :base_debate, :base_decipher, :base_diagnose, :base_infer, :base_recall, :base_improvise, :base_notice, :base_impress, :base_lead, :base_lie, :base_please, :base_empathize, :base_soothe, :base_specialties, :inventory)
  end

  def calculate_stats(character)
    smart_stats = {}
    stat_influencers = {
      "Human" => [[:drive, 1], [:regulate, 1], [:impress, -1], [:specialties, "Unwavering Will"]],
      "Elf" => [[:coordination, 1], [:maneuver, 1], [:destroy, -1], [:specialties, "Elven Grace"]],
      "Dwarf" => [[:athleticism, 1], [:grip, 1], [:decipher, -1], [:specialties, "Warrior's Instinct"]],
      "Noble" => [[:lead, 1]],
      "Middle Class" => [[:empathize, 1]],
      "Poor" => [[:improvise, 1]],
      "Soldier" => [[:endure, 1], [:specialties, "Battle Formation"]],
      "Hunter" => [[:notice, 1], [:specialties, "Surprise Takedown"]],
      "Scholar" => [[:recall, 1], [:specialties, "Expert Analysis"]],
      "Merchant" => [[:lie, 1], [:specialties, "Strategic Negotiation"]],
      "Farmer" => [[:create, 1], [:specialties, "Eye for Botany"]],
      "Successful" => [[:knowledge, 1], [:sociability, 1], [:debate, 1], [:soothe, -1]],
      "Peaceful" => [[:openness, 1], [:stability, 1], [:soothe, 1], [:run, -1]],
      "Adventurous" => [[:athleticism, 1], [:coordination, 1], [:leap, 1], [:regulate, -1]],
      "Tragic" => [[:coordination, 1], [:drive, 1], [:sneak, 1], [:please, -1]],
      "Art" => [[:create, 1]],
      "Competition" => [[:run, 1]],
      "Performance" => [[:impress, 1]],
      "Research" => [[:decipher, 1]],
      "Socialization" => [[:please, 1]],
      "Envy" => [[:drive, -1]],
      "Gluttony" => [[:athleticism, -1]],
      "Greed" => [[:sociability, -1]],
      "Pride" => [[:openness, -1]],
      "Sloth" => [[:coordination, -1]],
      "Wrath" => [[:stability, -1]],
      "Death" => [[:balance, -1]],
      "Helplessness" => [[:diagnose, -1]],
      "Isolation" => [[:lead, -1]],
      "Pain" => [[:endure, -1]]
    }

    smart_stats[:athleticism] = nil_to_zero(character.base_athleticism)
    smart_stats[:coordination] = nil_to_zero(character.base_coordination)
    smart_stats[:drive] = nil_to_zero(character.base_drive)
    smart_stats[:knowledge] = nil_to_zero(character.base_knowledge)
    smart_stats[:openness] = nil_to_zero(character.base_openness)
    smart_stats[:sociability] = nil_to_zero(character.base_sociability)
    smart_stats[:stability] = nil_to_zero(character.base_stability)
    smart_stats[:destroy] = nil_to_zero(character.base_destroy)
    smart_stats[:grip] = nil_to_zero(character.base_grip)
    smart_stats[:leap] = nil_to_zero(character.base_leap)
    smart_stats[:run] = nil_to_zero(character.base_run)
    smart_stats[:throw] = nil_to_zero(character.base_throw)
    smart_stats[:balance] = nil_to_zero(character.base_balance)
    smart_stats[:evade] = nil_to_zero(character.base_evade)
    smart_stats[:maneuver] = nil_to_zero(character.base_maneuver)
    smart_stats[:sneak] = nil_to_zero(character.base_sneak)
    smart_stats[:create] = nil_to_zero(character.base_create)
    smart_stats[:endure] = nil_to_zero(character.base_endure)
    smart_stats[:regulate] = nil_to_zero(character.base_regulate)
    smart_stats[:debate] = nil_to_zero(character.base_debate)
    smart_stats[:decipher] = nil_to_zero(character.base_decipher)
    smart_stats[:diagnose] = nil_to_zero(character.base_diagnose)
    smart_stats[:infer] = nil_to_zero(character.base_infer)
    smart_stats[:recall] = nil_to_zero(character.base_recall)
    smart_stats[:improvise] = nil_to_zero(character.base_improvise)
    smart_stats[:notice] = nil_to_zero(character.base_notice)
    smart_stats[:impress] = nil_to_zero(character.base_impress)
    smart_stats[:lead] = nil_to_zero(character.base_lead)
    smart_stats[:lie] = nil_to_zero(character.base_lie)
    smart_stats[:please] = nil_to_zero(character.base_please)
    smart_stats[:empathize] = nil_to_zero(character.base_empathize)
    smart_stats[:soothe] = nil_to_zero(character.base_soothe)
    smart_stats[:specialties] = ""

    smart_stats = apply_stat_changes_from(stat_influencers[character.species], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.family_type], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.occupation_type], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.backstory_type], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.hobby_type], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.habit_type], smart_stats)
    smart_stats = apply_stat_changes_from(stat_influencers[character.fear_type], smart_stats)

    class_health = 0
    if character.class_option == "Knight"
      class_health = 4
    elsif character.class_option == "Archer"
      class_health = 2
    end
    smart_stats[:total_health] = (character.level * smart_stats[:athleticism]) + (character.level * class_health)
    smart_stats[:destroy] += + smart_stats[:athleticism]
    smart_stats[:grip] += smart_stats[:athleticism]
    smart_stats[:leap] += smart_stats[:athleticism]
    smart_stats[:run] += smart_stats[:athleticism]
    smart_stats[:throw] += smart_stats[:athleticism]
    smart_stats[:balance] += smart_stats[:coordination]
    smart_stats[:evade] += smart_stats[:coordination]
    smart_stats[:maneuver] += smart_stats[:coordination]
    smart_stats[:sneak] += smart_stats[:coordination]
    smart_stats[:create] += smart_stats[:drive]
    smart_stats[:endure] += smart_stats[:drive]
    smart_stats[:regulate] += smart_stats[:drive]
    smart_stats[:debate] += smart_stats[:knowledge]
    smart_stats[:decipher] += smart_stats[:knowledge]
    smart_stats[:diagnose] += smart_stats[:knowledge]
    smart_stats[:infer] += smart_stats[:knowledge]
    smart_stats[:recall] += smart_stats[:knowledge]
    smart_stats[:improvise] += smart_stats[:openness]
    smart_stats[:notice] += smart_stats[:openness]
    smart_stats[:impress] += smart_stats[:sociability]
    smart_stats[:lead] += smart_stats[:sociability]
    smart_stats[:lie] += smart_stats[:sociability]
    smart_stats[:please] += smart_stats[:sociability]
    smart_stats[:empathize] += smart_stats[:stability]
    smart_stats[:soothe] += smart_stats[:stability]
    unless character.base_specialties == ""
      smart_stats[:specialties].concat(", " + character.base_specialties)
    end
    smart_stats
  end

  def nil_to_zero(num_value)
    if num_value
      return num_value
    end
    0
  end

  def apply_stat_changes_from(change_list, smart_stats)
    if change_list
      change_list.each do |current_change|
        if current_change[0] == :specialties && smart_stats[:specialties] != ""
          smart_stats[:specialties].concat(", " + current_change[1])
        else
          smart_stats[current_change[0]] += current_change[1]
        end
      end
    end
    smart_stats
  end
end
