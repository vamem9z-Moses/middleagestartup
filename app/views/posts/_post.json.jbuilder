json.extract! post, :id, :title, :body, :published, :publication_date, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
