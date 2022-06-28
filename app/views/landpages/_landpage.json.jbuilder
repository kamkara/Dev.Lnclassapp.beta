json.extract! landpage, :id, :title, :content, :slug, :status, :created_at, :updated_at
json.url landpage_url(landpage, format: :json)
