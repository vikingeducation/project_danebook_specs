# A User, by default, has a profile 
#created with it via the users controller

FactoryGirl.define do

	factory :user do
		first_name  			"Foo"
		last_name   			"Bar"
		# Sequence here!
		sequence(:email){ |n| "foo#{n}@bar.com"}       			
		password_digest 		"password"
		birthday 				"1980-01-01"
		gender					1

		after(:create) do
			create(:profile, :user_id => user.id)
		end

			# Associations
			# posts
			# likes
			# comments
	end
	
end