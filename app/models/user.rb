class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    belongs_to :student, :class_name => 'Student', :foreign_key => 'email'
end
