class AddPolymorphicToLikes < ActiveRecord::Migration
  def change

  	remove_column :likes, :post_id
  	
  	add_column :likes, :likeable_id, :integer
  	add_column :likes, :likeable_type, :string

  	add_index :likes, [:likeable_id, :likeable_type]
  end
end
