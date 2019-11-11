class StudentMailer < ApplicationMailer
    default from: 'evalmgr@scu.edu'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, 
             subject: "Welcome #{@user.email}")
    end

    def eval_email
        emails = Survey.pluck(:student_email)
        mail(to: emails, subject: "Lab Evaluation for")
    end

    def eval_reminder
        emails = Survey.pluck(:student_email)
        mail(to: emails, subject: "Lab Evaluation Reminder for")
    end
end
