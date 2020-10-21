class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to.hash
        end
    end
end
