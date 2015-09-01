require 'rails_helper'

describe Like do

	# Testing our assocuations using the Shoulda gem
	it { should belong_to(:user) }
	
	# Because polymorphic
	it { should belong_to(:likeable) }
	it { should have_one(:profile) }

end