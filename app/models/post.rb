class Post < ActiveRecord::Base

	# Let's add our associations
	belongs_to :user

	# CONCERN: This feels brittle... does a post really 
	# have one profile? Perhaps. 
	has_one :profile, :through => :user
	has_many :likes, :as => :likeable, :dependent => :destroy
	has_many :comments, :as => :commentable, :dependent => :destroy

	# End associations

	# Return true if a user has liked a particular post
	def liked_by?(user)
		self.likes.pluck(:user_id).include?(user.id) ? true : false
	end

	# Return the like_id given the post and the user
	def like_id(user)
		like = self.likes.where("user_id = ? ", user.id)
		like.first.id
	end

end
