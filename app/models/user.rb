class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username

    has_one :student, :class_name => 'Student'
    accepts_nested_attributes_for :student
end
