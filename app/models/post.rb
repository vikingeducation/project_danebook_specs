class Post < ActiveRecord::Base

	# Let's add our associations
	belongs_to :user

	# CONCERN: This feels brittle... does a post really 
	# have one profile? Perhaps. 
	has_one :profile, :through => :user
	has_many :comments, :as => :commentable, :dependent => :destroy

	# End associations

	include Likeable

end
