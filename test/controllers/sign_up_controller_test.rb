require "test_helper"

class SignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get prepa_philo" do
    get sign_up_prepa_philo_url
    assert_response :success
  end

  test "should get prepa_bac_ivoire" do
    get sign_up_prepa_bac_ivoire_url
    assert_response :success
  end
end
