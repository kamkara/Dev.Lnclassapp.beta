require "application_system_test_case"

class LandpagesTest < ApplicationSystemTestCase
  setup do
    @landpage = landpages(:one)
  end

  test "visiting the index" do
    visit landpages_url
    assert_selector "h1", text: "Landpages"
  end

  test "should create landpage" do
    visit landpages_url
    click_on "New landpage"

    fill_in "Content", with: @landpage.content
    fill_in "Slug", with: @landpage.slug
    fill_in "Status", with: @landpage.status
    fill_in "Title", with: @landpage.title
    click_on "Create Landpage"

    assert_text "Landpage was successfully created"
    click_on "Back"
  end

  test "should update Landpage" do
    visit landpage_url(@landpage)
    click_on "Edit this landpage", match: :first

    fill_in "Content", with: @landpage.content
    fill_in "Slug", with: @landpage.slug
    fill_in "Status", with: @landpage.status
    fill_in "Title", with: @landpage.title
    click_on "Update Landpage"

    assert_text "Landpage was successfully updated"
    click_on "Back"
  end

  test "should destroy Landpage" do
    visit landpage_url(@landpage)
    click_on "Destroy this landpage", match: :first

    assert_text "Landpage was successfully destroyed"
  end
end
