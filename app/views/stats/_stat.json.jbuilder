json.extract! stat, :id, :hits, :url, :shorturl, :sanitized_url, :created_at, :updated_at
json.url stat_url(stat, format: :json)