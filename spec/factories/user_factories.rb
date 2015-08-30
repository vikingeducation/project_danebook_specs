# A User, by default, has a profile 
#created with it via the users controller

FactoryGirl.define do

	factory :user do
		first_name  				"Foo"
		last_name   				"Bar"
		# Sequence here!
		sequence(:email){ |n| "foo#{n}@bar.com"}       			
		password_digest 		BCrypt::Password.create("password").to_s
		birthday 						"1980-01-01"
		gender							1

		after(:create) do |user|
			create(:profile, :user_id => user.id)
		end

		factory :user_with_post_like do
			after(:create) do |user|
				post = create( :post, :author_id => user.id )
				create( :like, :user_id => user.id, :likeable_id => post.id )
			end
		end

	end
	
end