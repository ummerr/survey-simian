class Survey < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :survey_responders
  has_many :responders, through: :survey_responders, class_name: "User"
  has_many :questions
end
