json.extract! course, :id, :title, :content, :level_name, :material_name, :teach_name, :slug, :contentImg, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
