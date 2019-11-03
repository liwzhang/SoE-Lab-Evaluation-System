require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest
  test "should get sections" do
    get professor_sections_url
    assert_response :success
  end

end
