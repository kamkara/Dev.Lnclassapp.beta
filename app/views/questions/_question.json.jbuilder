json.extract! question, :id, :content, :answer, :user_id, :exercice_id, :created_at, :updated_at
json.url question_url(question, format: :json)
