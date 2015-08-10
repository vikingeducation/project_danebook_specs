class Like < ActiveRecord::Base

	# Let's add our associations
	belongs_to :user
	belongs_to :likeable, :polymorphic => true
	# QUESTION: This association seems to pull the right thing
	# but I'm not really sure why that's happening.
	has_one :profile, :through => :user

	# End associations

end
