class Survey < ApplicationRecord

    def self.to_csv
        attributes = %w{Q1 Q2 Q3 Q4 Q5}
        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |survey|
                csv << survey.attributes.values_at(*attributes)
            end
        end
    end
end
