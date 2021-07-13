class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.bigint :user_id, null: false
      t.string :name, default: ""

      t.timestamps
    end
  end
end
