class SurveyResponder < ActiveRecord::Base
  belongs_to :survey
  belongs_to :responder, foreign_key: :user_id, class_name: "User"
end
