class Comment < ActiveRecord::Base
	
	# Let's add our associations
		# QUESTION: Can we call this another name, like :parent? How would I go
		# about doing this? ANSWER: Yes, you just have to specify the foreign key!
		belongs_to :commentable, :polymorphic => true
		belongs_to :author, :class_name => "User"	
		
	# End associations

	# Including concerns for likeable model
	include Likeable

end
