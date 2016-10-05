class RemoveMovieIdToReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :movie_id, :integer
  end
end
