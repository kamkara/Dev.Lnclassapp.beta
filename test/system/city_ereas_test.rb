require "application_system_test_case"

class CityEreasTest < ApplicationSystemTestCase
  setup do
    @city_erea = city_ereas(:one)
  end

  test "visiting the index" do
    visit city_ereas_url
    assert_selector "h1", text: "City ereas"
  end

  test "should create city erea" do
    visit city_ereas_url
    click_on "New city erea"

    fill_in "Slug", with: @city_erea.slug
    fill_in "Title", with: @city_erea.title
    fill_in "User", with: @city_erea.user_id
    click_on "Create City erea"

    assert_text "City erea was successfully created"
    click_on "Back"
  end

  test "should update City erea" do
    visit city_erea_url(@city_erea)
    click_on "Edit this city erea", match: :first

    fill_in "Slug", with: @city_erea.slug
    fill_in "Title", with: @city_erea.title
    fill_in "User", with: @city_erea.user_id
    click_on "Update City erea"

    assert_text "City erea was successfully updated"
    click_on "Back"
  end

  test "should destroy City erea" do
    visit city_erea_url(@city_erea)
    click_on "Destroy this city erea", match: :first

    assert_text "City erea was successfully destroyed"
  end
end
