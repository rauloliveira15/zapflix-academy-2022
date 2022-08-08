class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :movie_genre
  has_and_belongs_to_many :artist
  validates :title, :cover_url, :published_at, :director_id, :movie_genre_id, presence: true
end
