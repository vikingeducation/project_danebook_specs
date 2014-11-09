require 'rails_helper'

feature "Posts", :type => :feature do
  let(:user){create(:user)}

  before do
  	sign_in_user(user)

    visit user_posts_path(user)

    fill_in 'post_body', with: "All hail the supreme divine emperor, Peter, god of all worlds!"

    click_button 'Post'
  end

  scenario 'post on own timeline' do
    expect(page).to have_content "All hail the supreme divine emperor, Peter, god of all worlds!"
  end

  scenario 'delete own post' do
  	# delete the post using the find and click
  	post = Post.last
  	click_link "delete-post-#{post.id}"
  	# expect that post to not exist
  	expect(post).not_to exist
  end

end
