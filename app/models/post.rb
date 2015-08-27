class Post < ActiveRecord::Base

	# Let's add our associations
		belongs_to :author, :class_name => "User"
		has_one :profile, :through => :author
		has_many :comments, :as => :commentable, :dependent => :destroy

	# End associations

	# Including concerns for likeable model
	include Likeable

end
