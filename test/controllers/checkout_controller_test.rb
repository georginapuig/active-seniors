require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get checkout_new_url
    assert_response :success
  end

end
