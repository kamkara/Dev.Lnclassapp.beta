require "test_helper"

class CompagnyControllerTest < ActionDispatch::IntegrationTest
  test "should get mission" do
    get compagny_mission_url
    assert_response :success
  end

  test "should get terms" do
    get compagny_terms_url
    assert_response :success
  end

  test "should get data" do
    get compagny_data_url
    assert_response :success
  end

  test "should get membership" do
    get compagny_membership_url
    assert_response :success
  end
end
