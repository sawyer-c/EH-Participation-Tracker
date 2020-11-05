class User < ApplicationRecord
    before_create :confirmation_token
    has_secure_password
    validates_uniqueness_of :email

    enum role: [:member, :admin]

    has_one :student, :class_name => 'Student'
    accepts_nested_attributes_for :student
    
    has_and_belongs_to_many :event, through: :student
    accepts_nested_attributes_for :event

    after_initialize do
        if self.new_record?
            self.role ||= :admin
        end
    end
end
