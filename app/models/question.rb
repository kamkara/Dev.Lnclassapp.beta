class Question < ApplicationRecord
  belongs_to :user
  belongs_to :exercice
  
  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers
  validates_with QuestionValidator
  
  ################## Start RichText fields  ###############
  has_rich_text :content
  has_rich_text :answer
  ################## End RichText fields  ###############

  ################## Start FIX N+1  ###############
  Question.all.with_rich_text_content # Preload the body without attachments.
  Question.all.with_rich_text_content_and_embeds # Preload both body and attachments.
  
  Question.all.with_rich_text_answer 
  Question.all.with_rich_text_answer_and_embeds
  
  ################## End FIX N+1  ###############
  

  validates :content, :answer, :exercice_id, :user_id, presence: true
end
