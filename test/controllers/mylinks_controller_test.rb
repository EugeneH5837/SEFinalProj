require 'test_helper'

class MylinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mylink = mylinks(:one)
  end

  test "should get index" do
    get mylinks_url
    assert_response :success
  end

  test "should get new" do
    get new_mylink_url
    assert_response :success
  end

  test "should create mylink" do
    assert_difference('Mylink.count') do
      post mylinks_url, params: { mylink: { link: @mylink.link } }
    end

    assert_redirected_to mylink_url(Mylink.last)
  end

  test "should show mylink" do
    get mylink_url(@mylink)
    assert_response :success
  end

  test "should get edit" do
    get edit_mylink_url(@mylink)
    assert_response :success
  end

  test "should update mylink" do
    patch mylink_url(@mylink), params: { mylink: { link: @mylink.link } }
    assert_redirected_to mylink_url(@mylink)
  end

  test "should destroy mylink" do
    assert_difference('Mylink.count', -1) do
      delete mylink_url(@mylink)
    end

    assert_redirected_to mylinks_url
  end
end
