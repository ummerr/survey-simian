class Choice < ActiveRecord::Base
  belongs_to :question
  has_one :answer
end
