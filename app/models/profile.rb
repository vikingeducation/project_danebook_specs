class Profile < ActiveRecord::Base

	# Let's add our associations
		belongs_to :user
		has_many :posts, :through => :user

	# End associations

end
