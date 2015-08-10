class Comment < ActiveRecord::Base
	
	# Let's add our associations
		# QUESTION: Can we call this another name, like :parent? How would I go
		# about doing this?
		belongs_to :commentable, :polymorphic => true
		belongs_to :author, :class_name => "User"	
	# End associations

end
