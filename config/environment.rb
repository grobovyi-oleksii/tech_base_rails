# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: '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',
  domain: 'railway-stations.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}