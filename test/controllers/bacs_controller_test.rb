require "test_helper"

class BacsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bac = bacs(:one)
  end

  test "should get index" do
    get bacs_url
    assert_response :success
  end

  test "should get new" do
    get new_bac_url
    assert_response :success
  end

  test "should create bac" do
    assert_difference("Bac.count") do
      post bacs_url, params: { bac: { content: @bac.content, linked: @bac.linked, slug: @bac.slug, title: @bac.title } }
    end

    assert_redirected_to bac_url(Bac.last)
  end

  test "should show bac" do
    get bac_url(@bac)
    assert_response :success
  end

  test "should get edit" do
    get edit_bac_url(@bac)
    assert_response :success
  end

  test "should update bac" do
    patch bac_url(@bac), params: { bac: { content: @bac.content, linked: @bac.linked, slug: @bac.slug, title: @bac.title } }
    assert_redirected_to bac_url(@bac)
  end

  test "should destroy bac" do
    assert_difference("Bac.count", -1) do
      delete bac_url(@bac)
    end

    assert_redirected_to bacs_url
  end
end
