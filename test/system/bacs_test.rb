require "application_system_test_case"

class BacsTest < ApplicationSystemTestCase
  setup do
    @bac = bacs(:one)
  end

  test "visiting the index" do
    visit bacs_url
    assert_selector "h1", text: "Bacs"
  end

  test "should create bac" do
    visit bacs_url
    click_on "New bac"

    fill_in "Content", with: @bac.content
    fill_in "Linked", with: @bac.linked
    fill_in "Slug", with: @bac.slug
    fill_in "Title", with: @bac.title
    click_on "Create Bac"

    assert_text "Bac was successfully created"
    click_on "Back"
  end

  test "should update Bac" do
    visit bac_url(@bac)
    click_on "Edit this bac", match: :first

    fill_in "Content", with: @bac.content
    fill_in "Linked", with: @bac.linked
    fill_in "Slug", with: @bac.slug
    fill_in "Title", with: @bac.title
    click_on "Update Bac"

    assert_text "Bac was successfully updated"
    click_on "Back"
  end

  test "should destroy Bac" do
    visit bac_url(@bac)
    click_on "Destroy this bac", match: :first

    assert_text "Bac was successfully destroyed"
  end
end
