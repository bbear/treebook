require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "the /login route works" do
  	get '/login'
    assert_response :success
  end
  test "the /logout route works" do
  	get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end
  test "the /register route works" do
  	get '/register'
    assert_response :success
  end
end
