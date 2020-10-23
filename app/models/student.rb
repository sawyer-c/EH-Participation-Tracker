class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to_hash
        end
    end

    def self.to_csv
        attributes = %w{firstName, lastName, email, uin, year, major, gpa, status}

        CSV.generate(options) do |csv|
            csv << attributes
            all.each do |student|
                csv << [student.firstName, student.lastName, student.email, student.uin, student.year, student.major, student.gpa, student.status]
                csv << "\n"
            end
        end
    end
        
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true
    validates :uin, presence: true
    validates :year, presence: true
    validates :major, presence: true
    validates :gpa, presence: true
    validates :status, presence: true

    STANDING_LIST = ["Good Standing", "Bad Standing"]
end
