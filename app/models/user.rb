class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username

    enum role: [:member, :admin]

    has_one :student, :class_name => 'Student'
    accepts_nested_attributes_for :student

    after_initialize do
        if self.new_record?
            self.role ||= :admin
        end
    end
end
