require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_home_url
    assert_response :success
  end

  test "should get sections" do
    get admin_sections_url
    assert_response :success
  end

  test "should get professors" do
    get admin_professors_url
    assert_response :success
  end

  test "should get questions" do
    get admin_questions_url
    assert_response :success
  end

end
