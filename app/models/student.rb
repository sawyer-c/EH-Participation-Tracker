class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to_hash
        end
    end

    def self.to_csv(options = {})
        #attributes = %w{firstName, lastName, email, uin, year, major, gpa, status}

        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |student|
                csv << student.attributes.values_at{*column_names}
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
