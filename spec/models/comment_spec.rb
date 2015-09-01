require 'rails_helper'

describe Comment do

	# Testing our assocuations using the Shoulda gem
	
	# This is coming from the polymorphic relationship
	it { should belong_to(:commentable) }
	it { should belong_to(:author) }

	# From our likeable concern file
	it { should have_many(:likes) }

end