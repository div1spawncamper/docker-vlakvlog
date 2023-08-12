require "test_helper"

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  test "debería crear o encontrar un usuario al autenticarse con GitHub" do
    auth_data = {
      provider: "github",
      uid: "123456",
      info: {
        email: "test@example.com",
        nickname: "testuser"
      }
    }

    OmniAuth.config.add_mock(:github, auth_data)

    post :github

    user = User.find_by(provider: auth_data[:provider], uid: auth_data[:uid])
    assert_not_nil user

    assert user_signed_in?
    assert_redirected_to root_path
  end
end
