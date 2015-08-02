class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.date :birthday
    	# QUESTION: is there a better way to impliment gender than with an integer?
    	t.integer :gender

      t.timestamps null: false
    end
  end
end
