require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @welcome = welcomes(:one)
  end

  test "visiting the index" do
    visit welcomes_url
    assert_selector "h1", text: "Welcomes"
  end

  test "should create welcome" do
    visit welcomes_url
    click_on "New welcome"

    fill_in "All esp", with: @welcome.all_esp
    fill_in "Ang", with: @welcome.ang
    fill_in "Fr", with: @welcome.fr
    fill_in "Hg", with: @welcome.hg
    fill_in "Math", with: @welcome.math
    fill_in "Pc", with: @welcome.pc
    fill_in "Philo", with: @welcome.philo
    fill_in "Student message", with: @welcome.student_message
    fill_in "Svt", with: @welcome.svt
    fill_in "User", with: @welcome.user_id
    click_on "Create Welcome"

    assert_text "Welcome was successfully created"
    click_on "Back"
  end

  test "should update Welcome" do
    visit welcome_url(@welcome)
    click_on "Edit this welcome", match: :first

    fill_in "All esp", with: @welcome.all_esp
    fill_in "Ang", with: @welcome.ang
    fill_in "Fr", with: @welcome.fr
    fill_in "Hg", with: @welcome.hg
    fill_in "Math", with: @welcome.math
    fill_in "Pc", with: @welcome.pc
    fill_in "Philo", with: @welcome.philo
    fill_in "Student message", with: @welcome.student_message
    fill_in "Svt", with: @welcome.svt
    fill_in "User", with: @welcome.user_id
    click_on "Update Welcome"

    assert_text "Welcome was successfully updated"
    click_on "Back"
  end

  test "should destroy Welcome" do
    visit welcome_url(@welcome)
    click_on "Destroy this welcome", match: :first

    assert_text "Welcome was successfully destroyed"
  end
end
