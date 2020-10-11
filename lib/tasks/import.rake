require 'rubyXL'

namespace :import do
    desc "Import data from spreadsheet"
    task: data: :environment do
        puts 'Importing Data'

    data = rubyXL::Spreadsheet.open('lib/data/FILENAME')

    headers = data.row(1);

    data.each_with_index do |row, idx|
        next if idx == 0 #skip header

    student_data = Hash[[headers, row].transpose]

    if Student.exists?(uin: student_data['uin'])
        puts "Student with UIN '#{student_data['uin']}' already exists"
        next
    end

    student = Student.new(student_data)

    puts "Saving Student with UIN #{student.uin}"
    student.save!
    end
    end
end