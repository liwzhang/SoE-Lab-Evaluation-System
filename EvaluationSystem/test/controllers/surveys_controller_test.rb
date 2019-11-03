require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: { Q1: @survey.Q1, Q10: @survey.Q10, Q11: @survey.Q11, Q12: @survey.Q12, Q13: @survey.Q13, Q14: @survey.Q14, Q15: @survey.Q15, Q16: @survey.Q16, Q17: @survey.Q17, Q18: @survey.Q18, Q19: @survey.Q19, Q2: @survey.Q2, Q20: @survey.Q20, Q3: @survey.Q3, Q4: @survey.Q4, Q5: @survey.Q5, Q6: @survey.Q6, Q7: @survey.Q7, Q8: @survey.Q8, Q9: @survey.Q9, class_num: @survey.class_num, status: @survey.status, student_ID: @survey.student_ID, student_email: @survey.student_email, survey_ID: @survey.survey_ID } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { Q1: @survey.Q1, Q10: @survey.Q10, Q11: @survey.Q11, Q12: @survey.Q12, Q13: @survey.Q13, Q14: @survey.Q14, Q15: @survey.Q15, Q16: @survey.Q16, Q17: @survey.Q17, Q18: @survey.Q18, Q19: @survey.Q19, Q2: @survey.Q2, Q20: @survey.Q20, Q3: @survey.Q3, Q4: @survey.Q4, Q5: @survey.Q5, Q6: @survey.Q6, Q7: @survey.Q7, Q8: @survey.Q8, Q9: @survey.Q9, class_num: @survey.class_num, status: @survey.status, student_ID: @survey.student_ID, student_email: @survey.student_email, survey_ID: @survey.survey_ID } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
