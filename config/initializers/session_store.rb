# Be sure to restart your server when you modify this file.
case Rails.env
when "production"
  domain = 'openexam.org'
when "development"
  domain = 'lvh.me'
end

OpenExam::Application.config.session_store :cookie_store, key: '_open_exam_session', :domain => ".#{domain}"

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# OpenExam::Application.config.session_store :active_record_store
