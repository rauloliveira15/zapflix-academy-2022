class CreateJoinTableArtistMovie < ActiveRecord::Migration[7.0]
  def change
    create_join_table :artists, :movies do |t|
      t.index [:artist_id, :movie_id]
      t.index [:movie_id, :artist_id]
    end
  end
end
