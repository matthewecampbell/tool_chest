require_relative "../test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest

  test "a user can login successfully" do
    user = User.create(username: "Andrew", password: "password")

    visit login_path

    fill_in "session[username]", with: "Andrew"
    fill_in "session[password]", with: "password"

    click_on("Save Session")

    assert_equal user_path(user), current_path

    within("#greeting") do
      assert page.has_content?("Welcome, Andrew!")
    end
  end
  # 
  # test "user can't login with in correct password" do
  #   user = User.create(username: "andrew", password: "password")
  #
  #   visit login_path
  #   fill_in "session[username]", with: "andrew"
  #   fill_in "session[password]", with: 'fastword'
  #
  #   click_on 'Save Session'
  #
  #   assert_equal login_path, current_path
  #   assert page.has_content? "Invalid login"
  # end
  #
  # test "user can log out" do
  #   user = User.create(username: "andrew", password: "password")
  #   visit login_path
  #   fill_in "session[username]", with: "andrew"
  #   fill_in "session[password]", with: 'password'
  #
  #   click_on 'Save Session'
  #
  #   assert page.has_content?("andrew")
  #   page.find(".nav").click_on "logout"
  #   assert_equal root_path, current_path
  #   refute page.has_content?("andrew")
  # end

end
