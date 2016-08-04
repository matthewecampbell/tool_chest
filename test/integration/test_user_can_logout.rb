require_relative "../test_helper"

class UserCanLogoutTest < ActionDispatch::IntegrationTest

  test 'user can logout' do
    user = User.create(username: "Matt", password: "password")

    visit login_path

    fill_in "Username", with: "Matt"
    fill_in "Password", with: "password"

    click_on "login"

    assert_equal user_path(user), current_path

    click_on("Logout")

    assert_equal login_path, current_path

    refute page.has_content?("Matt")
  end

end
