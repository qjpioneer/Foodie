class AddAvgRatingToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :avg_rating, :float
  end
end
