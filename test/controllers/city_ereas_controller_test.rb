require "test_helper"

class CityEreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_erea = city_ereas(:one)
  end

  test "should get index" do
    get city_ereas_url
    assert_response :success
  end

  test "should get new" do
    get new_city_erea_url
    assert_response :success
  end

  test "should create city_erea" do
    assert_difference("CityErea.count") do
      post city_ereas_url, params: { city_erea: { slug: @city_erea.slug, title: @city_erea.title, user_id: @city_erea.user_id } }
    end

    assert_redirected_to city_erea_url(CityErea.last)
  end

  test "should show city_erea" do
    get city_erea_url(@city_erea)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_erea_url(@city_erea)
    assert_response :success
  end

  test "should update city_erea" do
    patch city_erea_url(@city_erea), params: { city_erea: { slug: @city_erea.slug, title: @city_erea.title, user_id: @city_erea.user_id } }
    assert_redirected_to city_erea_url(@city_erea)
  end

  test "should destroy city_erea" do
    assert_difference("CityErea.count", -1) do
      delete city_erea_url(@city_erea)
    end

    assert_redirected_to city_ereas_url
  end
end
