# This class is used to help with model management for surveys.
# It handles data that is sent to the survey model
class Survey < ApplicationRecord
#   belongs_to :section
#   has_many :questions

    # Gets all the values in a survey table, and puts them in a CSV file which will be outputed
    # Implicit parameters: ALL Survey objects
    def self.to_csv
        attributes = %w{Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20}
        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |survey|
                csv << survey.attributes.values_at(*attributes)
            end
        end
    end
end
