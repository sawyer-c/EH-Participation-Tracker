class Student < ApplicationRecord
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true
    validates :uin, presence: true
    validates :gradYear, presence: true
    validates :major, presence: true
    validates :status, presence: true

    STANDING_LIST = ["Good Standing", "Bad Standing"]
end
