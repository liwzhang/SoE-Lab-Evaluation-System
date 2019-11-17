class Section < ApplicationRecord
  #has_many :surveys, dependent: :destroy

    def self.to_csv
        @relevantSurveys = Survey.where(class_num: self.class_num)
        #write method to print out surveys for each section
        attributes = %w{Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20}

        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |survey|
                csv << survey.attributes.values_at(*attributes)
            end
        end
    end
end
