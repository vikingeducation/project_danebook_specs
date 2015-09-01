# There's really not much here, just 
# the bare bones like.

FactoryGirl.define do

	factory :comment do
		commentable_type			"Post"
		content 							"Look, a comment!"
	end
	
end