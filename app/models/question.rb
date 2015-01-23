class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_one :answer, through: :choices
end
