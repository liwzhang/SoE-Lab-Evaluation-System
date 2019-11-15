# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

    def welcome_email
        user = User.last
        StudentMailer.welcome_email(user)
    end

    def eval_email
        survey = Survey.last
        section = Section.find_by(class_num: survey.class_num)
        StudentMailer.eval_email(survey, section)
    end

end
