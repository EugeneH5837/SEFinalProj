require 'test_helper'

class GlobalLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_link = global_links(:one)
  end

  test "should get index" do
    get global_links_url
    assert_response :success
  end

  test "should get new" do
    get new_global_link_url
    assert_response :success
  end

  test "should create global_link" do
    assert_difference('GlobalLink.count') do
      post global_links_url, params: { global_link: { link: @global_link.link } }
    end

    assert_redirected_to global_link_url(GlobalLink.last)
  end

  test "should show global_link" do
    get global_link_url(@global_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_link_url(@global_link)
    assert_response :success
  end

  test "should update global_link" do
    patch global_link_url(@global_link), params: { global_link: { link: @global_link.link } }
    assert_redirected_to global_link_url(@global_link)
  end

  test "should destroy global_link" do
    assert_difference('GlobalLink.count', -1) do
      delete global_link_url(@global_link)
    end

    assert_redirected_to global_links_url
  end
end
