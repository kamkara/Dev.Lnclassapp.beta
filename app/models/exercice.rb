class Exercice < ApplicationRecord
  #############  Relations ##############
  belongs_to :user
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  #has_many :notes
  
  
  #############  Scopes ##############
  scope :ready, -> { where("published == true")}
  scope :chrono, -> { order(created_at: :desc)}
  
  
  #############  Validations ##############
  validates_with ExerciceValidator, on: :create
  validates_with PublicationValidator, on: :update
  
  ########### completed exercice  #########
  def completed_by(user)
    results.any? {|r| r.user == user}
  end
  
  ########### user grade  #########
  def user_grade(user)
    results.where(user_id: user).first.grade()
  end

    
  ############ Result ###################
  def build_result
    r = self.results.build()
    self.questions.each {|q| r.answered_questions.build(question: q)}
    return r
  end

  ############ SLUG ###################
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
  
end
