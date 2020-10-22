class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    has_one :student, :class_name => 'Student', :foreign_key => 'uin'
end
