class StudentMailer < ApplicationMailer
    default from: 'evalmgr@scu.edu'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, 
             subject: "Welcome #{@user.email}")
    end

    def eval_email(survey, section)
        @survey = survey
        @section = section
        #emails = Survey.pluck(:student_email)
        mail(to: @survey.student_email, subject: "Lab Evaluation for #{@section.title}, #{@section.subject} #{@section.catalog}")
    end

    def eval_reminder
        emails = Survey.pluck(:student_email)
        mail(to: emails, subject: "Lab Evaluation Reminder for")
    end
end
