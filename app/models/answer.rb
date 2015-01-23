class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :responder, foreign_key: :user_id, class_name: "User"
end
