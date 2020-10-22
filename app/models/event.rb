class Event < ApplicationRecord

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :event_type, presence: true

    has_and_belongs_to_many :students
end
