require_relative '../test_helper'

class UserCanLogInTest < ActionDispatch::IntegrationTest

  test 'user can log in successfull' do
    user = User.create(username: "Matt", password: "password")

    visit login_path

    fill_in "Username", with: "Matt"
    fill_in "Password", with: "password"

    click_on "login"

    assert_equal user_path(user), current_path

    within("#greeting") do
      assert page.has_content?("Welcome, Matt!")
    end
  end

end
