# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :events
end
