require "test_helper"

class RepertoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repertory = repertories(:one)
  end

  test "should get index" do
    get repertories_url
    assert_response :success
  end

  test "should get new" do
    get new_repertory_url
    assert_response :success
  end

  test "should create repertory" do
    assert_difference("Repertory.count") do
      post repertories_url, params: { repertory: { name: @repertory.name } }
    end

    assert_redirected_to repertory_url(Repertory.last)
  end

  test "should show repertory" do
    get repertory_url(@repertory)
    assert_response :success
  end

  test "should get edit" do
    get edit_repertory_url(@repertory)
    assert_response :success
  end

  test "should update repertory" do
    patch repertory_url(@repertory), params: { repertory: { name: @repertory.name } }
    assert_redirected_to repertory_url(@repertory)
  end

  test "should destroy repertory" do
    assert_difference("Repertory.count", -1) do
      delete repertory_url(@repertory)
    end

    assert_redirected_to repertories_url
  end
end
