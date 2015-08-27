class Like < ActiveRecord::Base

	# Let's add our associations
	
		belongs_to :user
		belongs_to :likeable, :polymorphic => true
		has_one :profile, :through => :user

	# End associations

end
