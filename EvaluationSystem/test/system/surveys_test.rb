require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "creating a Survey" do
    visit surveys_url
    click_on "New Survey"

    fill_in "Q1", with: @survey.Q1
    fill_in "Q10", with: @survey.Q10
    fill_in "Q11", with: @survey.Q11
    fill_in "Q12", with: @survey.Q12
    fill_in "Q13", with: @survey.Q13
    fill_in "Q14", with: @survey.Q14
    fill_in "Q15", with: @survey.Q15
    fill_in "Q16", with: @survey.Q16
    fill_in "Q17", with: @survey.Q17
    fill_in "Q18", with: @survey.Q18
    fill_in "Q19", with: @survey.Q19
    fill_in "Q2", with: @survey.Q2
    fill_in "Q20", with: @survey.Q20
    fill_in "Q3", with: @survey.Q3
    fill_in "Q4", with: @survey.Q4
    fill_in "Q5", with: @survey.Q5
    fill_in "Q6", with: @survey.Q6
    fill_in "Q7", with: @survey.Q7
    fill_in "Q8", with: @survey.Q8
    fill_in "Q9", with: @survey.Q9
    fill_in "Class num", with: @survey.class_num
    check "Status" if @survey.status
    fill_in "Student id", with: @survey.student_ID
    fill_in "Student email", with: @survey.student_email
    fill_in "Survey id", with: @survey.survey_ID
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "updating a Survey" do
    visit surveys_url
    click_on "Edit", match: :first

    fill_in "Q1", with: @survey.Q1
    fill_in "Q10", with: @survey.Q10
    fill_in "Q11", with: @survey.Q11
    fill_in "Q12", with: @survey.Q12
    fill_in "Q13", with: @survey.Q13
    fill_in "Q14", with: @survey.Q14
    fill_in "Q15", with: @survey.Q15
    fill_in "Q16", with: @survey.Q16
    fill_in "Q17", with: @survey.Q17
    fill_in "Q18", with: @survey.Q18
    fill_in "Q19", with: @survey.Q19
    fill_in "Q2", with: @survey.Q2
    fill_in "Q20", with: @survey.Q20
    fill_in "Q3", with: @survey.Q3
    fill_in "Q4", with: @survey.Q4
    fill_in "Q5", with: @survey.Q5
    fill_in "Q6", with: @survey.Q6
    fill_in "Q7", with: @survey.Q7
    fill_in "Q8", with: @survey.Q8
    fill_in "Q9", with: @survey.Q9
    fill_in "Class num", with: @survey.class_num
    check "Status" if @survey.status
    fill_in "Student id", with: @survey.student_ID
    fill_in "Student email", with: @survey.student_email
    fill_in "Survey id", with: @survey.survey_ID
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey" do
    visit surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey was successfully destroyed"
  end
end
