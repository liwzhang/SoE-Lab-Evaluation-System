# Subclass of ApplicationMailer responsible for housing different emails for our application

class StudentMailer < ApplicationMailer
    default from: 'evalmgr@scu.edu'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, 
             subject: "Welcome #{@user.email}")
    end

    # Sends the initial eval email
    def eval_email(survey, section, check)
        @survey = survey
        @section = section
        mail(to: @survey.student_email, subject: "Lab Evaluation for #{@section.title}, #{@section.subject} #{@section.catalog}")
    end

    # Sends a reminder eval email
    def eval_reminder(survey, section)
        @survey = survey
        @section = section
        if @survey.status == false
            mail(to: @survey.student_email, subject: "Lab Evaluation Reminder for #{@section.title}, #{@section.subject} #{@section.catalog}")
        end 
    end
end
