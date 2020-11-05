class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email

    has_one :student, :class_name => 'Student'
    accepts_nested_attributes_for :student
    
    has_and_belongs_to_many :event, through: :student
    accepts_nested_attributes_for :event

    def activate
        update_attribute(:activated,    true)
        update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email.
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
     end
end
