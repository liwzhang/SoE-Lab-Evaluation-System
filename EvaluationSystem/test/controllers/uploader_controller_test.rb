require 'test_helper'

class UploaderControllerTest < ActionDispatch::IntegrationTest
  test "should get proUpload" do
    get uploader_proUpload_url
    assert_response :success
  end

end
