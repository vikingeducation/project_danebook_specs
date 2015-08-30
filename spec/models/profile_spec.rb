require 'rails_helper'

describe Profile do
	# Testing our assocuations using the Shoulda gem
	it { should belong_to(:user) }
	it { should have_many(:posts) }

end