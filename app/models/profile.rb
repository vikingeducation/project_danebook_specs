class Profile < ActiveRecord::Base

	# Let's add our associations
	belongs_to :user

end
