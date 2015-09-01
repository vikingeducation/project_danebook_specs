class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id, null: false
    	t.string :college
    	t.string :hometown
    	t.string :currently_live
    	t.integer :phone
    	t.text :words_to_live_by
    	t.text :bio

      t.timestamps null: false
    end

    add_index :profiles, :user_id 
  end
end
