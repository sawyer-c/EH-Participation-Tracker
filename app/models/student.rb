class Student < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Student.create! row.to.hash
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
