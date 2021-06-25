require "application_system_test_case"

class CarriagesTest < ApplicationSystemTestCase
  setup do
    @carriage = carriages(:one)
  end

  test "visiting the index" do
    visit carriages_url
    assert_selector "h1", text: "Carriages"
  end

  test "creating a Carriage" do
    visit carriages_url
    click_on "New Carriage"

    click_on "Create Carriage"

    assert_text "Carriage was successfully created"
    click_on "Back"
  end

  test "updating a Carriage" do
    visit carriages_url
    click_on "Edit", match: :first

    click_on "Update Carriage"

    assert_text "Carriage was successfully updated"
    click_on "Back"
  end

  test "destroying a Carriage" do
    visit carriages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carriage was successfully destroyed"
  end
end
