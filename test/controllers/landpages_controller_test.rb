require "test_helper"

class LandpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @landpage = landpages(:one)
  end

  test "should get index" do
    get landpages_url
    assert_response :success
  end

  test "should get new" do
    get new_landpage_url
    assert_response :success
  end

  test "should create landpage" do
    assert_difference("Landpage.count") do
      post landpages_url, params: { landpage: { content: @landpage.content, slug: @landpage.slug, status: @landpage.status, title: @landpage.title } }
    end

    assert_redirected_to landpage_url(Landpage.last)
  end

  test "should show landpage" do
    get landpage_url(@landpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_landpage_url(@landpage)
    assert_response :success
  end

  test "should update landpage" do
    patch landpage_url(@landpage), params: { landpage: { content: @landpage.content, slug: @landpage.slug, status: @landpage.status, title: @landpage.title } }
    assert_redirected_to landpage_url(@landpage)
  end

  test "should destroy landpage" do
    assert_difference("Landpage.count", -1) do
      delete landpage_url(@landpage)
    end

    assert_redirected_to landpages_url
  end
end
