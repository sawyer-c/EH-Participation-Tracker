class Event < ApplicationRecord
	belongs_to :type
	validates_presence_of :name
	validates_numericality_of :eventID
end
