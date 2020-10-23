class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to_hash
        end
    end

    def self.to_csv
        attributes = %w{firstName, lastName, email, uin, year, major, gpa, status}

        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |student|
                csv << attributes.map {|attr| student.send(attr)}
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
