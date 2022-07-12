require "application_system_test_case"

class RepertoriesTest < ApplicationSystemTestCase
  setup do
    @repertory = repertories(:one)
  end

  test "visiting the index" do
    visit repertories_url
    assert_selector "h1", text: "Repertories"
  end

  test "should create repertory" do
    visit repertories_url
    click_on "New repertory"

    fill_in "Name", with: @repertory.name
    click_on "Create Repertory"

    assert_text "Repertory was successfully created"
    click_on "Back"
  end

  test "should update Repertory" do
    visit repertory_url(@repertory)
    click_on "Edit this repertory", match: :first

    fill_in "Name", with: @repertory.name
    click_on "Update Repertory"

    assert_text "Repertory was successfully updated"
    click_on "Back"
  end

  test "should destroy Repertory" do
    visit repertory_url(@repertory)
    click_on "Destroy this repertory", match: :first

    assert_text "Repertory was successfully destroyed"
  end
end
