class User < ActiveRecord::Base
  has_secure_password
  has_many :created_surveys, class_name: "Survey"
  has_many :survey_responders
  has_many :surveys, through: :survey_responders
  has_many :answers
end
