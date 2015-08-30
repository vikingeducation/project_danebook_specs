require 'rails_helper'

describe Post do

	# Testing our assocuations using the Shoulda gem
	it { should belong_to(:author) }
	it {should have_one(:profile) }
	it {should have_many(:comments) }

	# Coming from our Likeable concern file
	it {should have_many(:likes) }

	# I'm only going to test the model methods for my 
	# likeable concern here, though I could in post as well.

	let(:user){ create(:user) }
	let(:user_with_post_like){ create(:user_with_post_like) }

	# liked_by?(user) returns true if the user has liked a particulr post
	it 'returns true if a user has liked a particular post' do
		user = user_with_post_like
		post = Post.first
		expect( post.liked_by?(user) ).to eq(true)
	end

	it 'returns false if a user has NOT liked a particular post' do
		user = user_with_post_like
		# Setting :author_id to a different ID than our current user
		post = create(:post, :author_id => 20)
		expect( post.liked_by?(user) ).to eq(false)
	end

	# like_id(user) returns the id of the like given the user
	it 'returns the ID of a like given a user' do
		user = user_with_post_like
		post = Post.first
		like = Like.first
		expect( post.like_id(user) ).to eq(like.id)
	end
	
end