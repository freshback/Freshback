require 'test_helper'

class KeshbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get keshbacks_index_url
    assert_response :success
  end

  test "should get show" do
    get keshbacks_show_url
    assert_response :success
  end

  test "should get new" do
    get keshbacks_new_url
    assert_response :success
  end

  test "should get edit" do
    get keshbacks_edit_url
    assert_response :success
  end

end
