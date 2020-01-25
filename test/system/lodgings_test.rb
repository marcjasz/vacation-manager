require "application_system_test_case"

class LodgingsTest < ApplicationSystemTestCase
  setup do
    @lodging = lodgings(:one)
  end

  test "visiting the index" do
    visit lodgings_url
    assert_selector "h1", text: "Lodgings"
  end

  test "creating a Lodging" do
    visit lodgings_url
    click_on "New Lodging"

    fill_in "Address", with: @lodging.address
    fill_in "Capacity", with: @lodging.capacity
    fill_in "Company", with: @lodging.company
    fill_in "Email", with: @lodging.email
    fill_in "Name", with: @lodging.name
    fill_in "Owner", with: @lodging.owner
    fill_in "Phone number", with: @lodging.phone_number
    click_on "Create Lodging"

    assert_text "Lodging was successfully created"
    click_on "Back"
  end

  test "updating a Lodging" do
    visit lodgings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @lodging.address
    fill_in "Capacity", with: @lodging.capacity
    fill_in "Company", with: @lodging.company
    fill_in "Email", with: @lodging.email
    fill_in "Name", with: @lodging.name
    fill_in "Owner", with: @lodging.owner
    fill_in "Phone number", with: @lodging.phone_number
    click_on "Update Lodging"

    assert_text "Lodging was successfully updated"
    click_on "Back"
  end

  test "destroying a Lodging" do
    visit lodgings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lodging was successfully destroyed"
  end
end
