require 'test_helper'

class RoutesTest < ActionController::TestCase
  test 'github login' do
    assert_routing '/users/auth/github/callback', { controller: "users/omniauth_callbacks", action: "github" }
  end

  test 'github login post' do
    assert_routing({ path: "/users/auth/github/callback", method: "post"}, { controller: "users/omniauth_callbacks", action: "github" })
  end
end
