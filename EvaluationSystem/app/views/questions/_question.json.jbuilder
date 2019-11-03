json.extract! question, :id, :question_ID, :category, :question_type, :content, :created_at, :updated_at
json.url question_url(question, format: :json)
