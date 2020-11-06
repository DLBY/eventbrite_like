require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get check_if_admin" do
    get admin_check_if_admin_url
    assert_response :success
  end

end
