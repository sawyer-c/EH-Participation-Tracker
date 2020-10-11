require 'rubyXL'

namespace :export do
    file = "#{Rails.root}/public/outputdata.xlsx"

    table = Student.all;0

    XLSX.open(file, 'w') do |writer|
        writer << table.first.attributes.map {|a,v| a}
        table.each do |s|
            writer << s.attributes.map {|a,v| v}
        end
    end
end