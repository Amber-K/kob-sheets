class AddFieldsToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :allegiance, :string
    add_column :characters, :class_option, :string
    add_column :characters, :level, :integer
    add_column :characters, :current_health, :integer

    add_column :characters, :age, :string
    add_column :characters, :sex, :string
    add_column :characters, :height, :string
    add_column :characters, :weight, :string
    add_column :characters, :body_type, :string
    add_column :characters, :skin, :string
    add_column :characters, :race_ethnicity, :string
    add_column :characters, :eyes, :string
    add_column :characters, :hair, :string
    add_column :characters, :distinguishing_features, :string
    add_column :characters, :outfit, :string
    add_column :characters, :carries, :string

    add_column :characters, :species, :string
    add_column :characters, :family_type, :string
    add_column :characters, :family_description, :text
    add_column :characters, :occupation_type, :string
    add_column :characters, :occupation_description, :text
    add_column :characters, :backstory_type, :string
    add_column :characters, :backstory_description, :text
    add_column :characters, :likes, :text
    add_column :characters, :dislikes, :text
    add_column :characters, :hobby_type, :string
    add_column :characters, :hobby_description, :text
    add_column :characters, :habit_type, :string
    add_column :characters, :habit_description, :text
    add_column :characters, :fear_type, :string
    add_column :characters, :fear_description, :text
    add_column :characters, :quirk_type, :string
    add_column :characters, :quirk_description, :text

    add_column :characters, :base_athleticism, :integer
    add_column :characters, :base_coordination, :integer
    add_column :characters, :base_drive, :integer
    add_column :characters, :base_knowledge, :integer
    add_column :characters, :base_openness, :integer
    add_column :characters, :base_sociability, :integer
    add_column :characters, :base_stability, :integer

    add_column :characters, :base_destroy, :integer
    add_column :characters, :base_grip, :integer
    add_column :characters, :base_leap, :integer
    add_column :characters, :base_run, :integer
    add_column :characters, :base_throw, :integer

    add_column :characters, :base_balance, :integer
    add_column :characters, :base_evade, :integer
    add_column :characters, :base_maneuver, :integer
    add_column :characters, :base_sneak, :integer

    add_column :characters, :base_create, :integer
    add_column :characters, :base_endure, :integer
    add_column :characters, :base_regulate, :integer

    add_column :characters, :base_debate, :integer
    add_column :characters, :base_decipher, :integer
    add_column :characters, :base_diagnose, :integer
    add_column :characters, :base_infer, :integer
    add_column :characters, :base_recall, :integer

    add_column :characters, :base_improvise, :integer
    add_column :characters, :base_notice, :integer

    add_column :characters, :base_impress, :integer
    add_column :characters, :base_lead, :integer
    add_column :characters, :base_lie, :integer
    add_column :characters, :base_please, :integer

    add_column :characters, :base_empathize, :integer
    add_column :characters, :base_soothe, :integer

    add_column :characters, :base_specialties, :text
  end
end
