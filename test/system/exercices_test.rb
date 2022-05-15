require "application_system_test_case"

class ExercicesTest < ApplicationSystemTestCase
  setup do
    @exercice = exercices(:one)
  end

  test "visiting the index" do
    visit exercices_url
    assert_selector "h1", text: "Exercices"
  end

  test "should create exercice" do
    visit exercices_url
    click_on "New exercice"

    fill_in "Course", with: @exercice.course_id
    fill_in "Name", with: @exercice.name
    check "Published" if @exercice.published
    fill_in "Slug", with: @exercice.slug
    fill_in "User", with: @exercice.user_id
    click_on "Create Exercice"

    assert_text "Exercice was successfully created"
    click_on "Back"
  end

  test "should update Exercice" do
    visit exercice_url(@exercice)
    click_on "Edit this exercice", match: :first

    fill_in "Course", with: @exercice.course_id
    fill_in "Name", with: @exercice.name
    check "Published" if @exercice.published
    fill_in "Slug", with: @exercice.slug
    fill_in "User", with: @exercice.user_id
    click_on "Update Exercice"

    assert_text "Exercice was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercice" do
    visit exercice_url(@exercice)
    click_on "Destroy this exercice", match: :first

    assert_text "Exercice was successfully destroyed"
  end
end
