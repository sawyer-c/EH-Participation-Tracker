class Event < ApplicationRecord

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :event_type, presence: true

    has_and_belongs_to_many :student, :class_name => "Student"
    accepts_nested_attributes_for :student

    has_and_belongs_to_many :user, through: :student
    accepts_nested_attributes_for :user
end
