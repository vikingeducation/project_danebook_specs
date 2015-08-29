FactoryGirl.define do

	factory :profile do
        # Remember, a profile needs a user_id present.
        # This factory doens't provide one so a profile
        # must be created with a user.
        college   				"Syracuse University"
        hometown       			"Syracuse, NY"
        currently_live			"New York, NY"
        phone 					"2125551234"
        words_to_live_by		"Lorem ipsum..." 
        bio						"Lorem ipsum..."

    # Associations
    
    # QUESTION: When I add the user association right here I get
    # a 'stack too deep' error- what gives?
    #user
    
    #posts
  end

end