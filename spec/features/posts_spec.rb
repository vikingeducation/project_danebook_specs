require 'rails_helper'

feature "Posts", :type => :feature do
  let(:user){create(:user)}

  scenario 'post on own timeline' do
    sign_in_user(user)

    visit user_posts_path(user)

    fill_in 'post_body', with: "All hail the supreme divine emperor, Peter, god of all worlds!"

    click_button 'Post'

    expect(page).to have_content "All hail the supreme divine emperor, Peter, god of all worlds!"
  end

  scenario 'delete own post'

end
