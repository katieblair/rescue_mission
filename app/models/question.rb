class Question < ActiveRecord::Base
  has_many :answers

  validates :title, length: { minimum: 1 }
  validates :description, length: { minimum: 2 }
end
