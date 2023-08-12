require "test_helper"

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  test "debería crear o encontrar un usuario al autenticarse con GitHub" do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    auth_data = {
      provider: "github",
      uid: "123456",
      info: {
        email: "test@example.com",
        nickname: "testuser"
      }
    }
    
    OmniAuth.config.add_mock(:github, auth_data)
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    
    post :github
  
    user = User.find_by(provider: auth_data[:provider], uid: auth_data[:uid])
    assert_not_nil user
    assert_equal user.email, auth_data[:info][:email]
    assert_equal user.username, auth_data[:info][:nickname]
    assert_equal user.provider, auth_data[:provider]
    assert_equal user.uid, auth_data[:uid] 
    assert_redirected_to root_path
  end
end
