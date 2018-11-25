require 'test_helper'

class RoleSpecificLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_specific_link = role_specific_links(:one)
  end

  test "should get index" do
    get role_specific_links_url
    assert_response :success
  end

  test "should get new" do
    get new_role_specific_link_url
    assert_response :success
  end

  test "should create role_specific_link" do
    assert_difference('RoleSpecificLink.count') do
      post role_specific_links_url, params: { role_specific_link: { correspondingRole: @role_specific_link.correspondingRole, link: @role_specific_link.link } }
    end

    assert_redirected_to role_specific_link_url(RoleSpecificLink.last)
  end

  test "should show role_specific_link" do
    get role_specific_link_url(@role_specific_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_specific_link_url(@role_specific_link)
    assert_response :success
  end

  test "should update role_specific_link" do
    patch role_specific_link_url(@role_specific_link), params: { role_specific_link: { correspondingRole: @role_specific_link.correspondingRole, link: @role_specific_link.link } }
    assert_redirected_to role_specific_link_url(@role_specific_link)
  end

  test "should destroy role_specific_link" do
    assert_difference('RoleSpecificLink.count', -1) do
      delete role_specific_link_url(@role_specific_link)
    end

    assert_redirected_to role_specific_links_url
  end
end
