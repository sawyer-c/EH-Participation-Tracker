class User < ApplicationRecord
    before_create :confirmation_token
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

     private
        def confirmation_token
            if self.confirm_token.blank?
                self.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
end
