class Result < ApplicationRecord

  ####### relations #######
  belongs_to :user
  belongs_to :exercice
  has_many :answered_questions, dependent: :destroy
  has_many :questions, through: :answered_questions
  has_many :answers, through: :answered_questions
  validates_with ResultValidator

  accepts_nested_attributes_for :answered_questions
    
############ Grade #############
  def grade
    correct = answers.where(correct: true).count
    percentage = (correct.to_f / answers.count.to_f) * 100
    return "#{percentage.to_i}%"
  end
end
