class Comment < ActiveRecord::Base
	
	# Let's add our associations
		# QUESTION: Can we call this another name, like :parent? How would I go
		# about doing this?
		belongs_to :commentable, :polymorphic => true
		belongs_to :author, :class_name => "User"	
		has_many :likes, :as => :likeable, :dependent => :destroy
	# End associations

	# Return true if a user has liked a particular post
	# TODO: This is smelly, it's being used in two places, 
	# here and in post.rb. Need to refactor.
	def liked_by?(user)
		self.likes.pluck(:user_id).include?(user.id) ? true : false
	end

	# Return the like_id given the post and the user
	# TODO: SAME AS ABOVE this is used in post.rb. Need 
	# to refactor.
	def like_id(user)
		like = self.likes.where("user_id = ? ", user.id)
		like.first.id
	end

end
