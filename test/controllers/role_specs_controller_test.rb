require 'test_helper'

class RoleSpecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_spec = role_specs(:one)
  end

  test "should get index" do
    get role_specs_url
    assert_response :success
  end

  test "should get new" do
    get new_role_spec_url
    assert_response :success
  end

  test "should create role_spec" do
    assert_difference('RoleSpec.count') do
      post role_specs_url, params: { role_spec: { link: @role_spec.link, role_id: @role_spec.role_id } }
    end

    assert_redirected_to role_spec_url(RoleSpec.last)
  end

  test "should show role_spec" do
    get role_spec_url(@role_spec)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_spec_url(@role_spec)
    assert_response :success
  end

  test "should update role_spec" do
    patch role_spec_url(@role_spec), params: { role_spec: { link: @role_spec.link, role_id: @role_spec.role_id } }
    assert_redirected_to role_spec_url(@role_spec)
  end

  test "should destroy role_spec" do
    assert_difference('RoleSpec.count', -1) do
      delete role_spec_url(@role_spec)
    end

    assert_redirected_to role_specs_url
  end
end
