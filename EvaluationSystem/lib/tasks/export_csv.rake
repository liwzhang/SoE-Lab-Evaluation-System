=begin require 'csv'

file = "#{Rails.root}/public/data.csv"

table = Survey.all;0

CSV.open( file, 'w' ) do |writer|
    writer << table.first.attributes.map { |a,v| a }
    table.each do |s|
        writer << s.attributes.map { |a,v| v }
    end
end =end