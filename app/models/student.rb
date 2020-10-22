class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to_hash
        end
    end

    def self.export
        attributes = %w{uin, firstName, lastName, email, gradYear, major, status}

        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |sutdent|
                csv << attributes.map{ |attr| student.send(attr)}
            end
        end
    end
        
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true
    validates :uin, presence: true
    validates :gradYear, presence: true
    validates :major, presence: true
    validates :status, presence: true

    STANDING_LIST = ["Good Standing", "Bad Standing"]
end
