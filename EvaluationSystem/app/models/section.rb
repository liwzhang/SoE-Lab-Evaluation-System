class Section < ApplicationRecord
  #has_many :surveys, dependent: :destroy
    def to_csv
        attributes = %w{Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20}
        CSV.generate(headers: true) do |csv|
            csv << attributes
            x = Survey.where(class_num: self.class_num )
            x.all.each do |survey2|
                csv << survey2.attributes.values_at(*attributes)
            end
        end
    end

    def self.to_csv
        #@relevantSurveys = Survey.where(class_num: self.class_num)
        #write method to print out surveys for each section
        attributes = %w{Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20}
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |survey|
                x = Survey.where(class_num: survey.class_num )
                x.all.each do |survey2|
                    csv << survey2.attributes.values_at(*attributes)
                end
            end
        end
    end
end
