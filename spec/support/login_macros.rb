module LoginMacros

  def sign_in(user)
    visit root_path
    fill_in('email', :with => user.email)
    fill_in('password', :with => "password")
    click_on('Login')
  end

  def sign_out
    visit root_path
    click_link "Logout"
  end

  def sign_in_with_post(user)
    sign_in(user)
    visit profile_posts_path(user)
    fill_in('post_content', :with => "This is my test post!")
    click_button("Post")
  end

end