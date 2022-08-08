json.extract! movie, :id, :title, :cover_url, :published_at, :director_id, :movie_genre_id, :sinopse, artist_ids:[], :created_at, :updated_at
json.url movie_url(movie, format: :json)
