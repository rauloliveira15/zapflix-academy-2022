class RemoveArtistFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_reference :movies, :artist, null: false, foreign_key: true
  end
end
