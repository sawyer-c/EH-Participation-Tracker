class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@eh-participation-tracker.herokuapp.com'
  layout 'mailer'
end
