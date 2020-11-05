# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :username

  enum role: %i[member admin]

  has_one :student, class_name: 'Student'
  accepts_nested_attributes_for :student

  after_initialize do
    self.role ||= :admin if new_record?
  end
end
