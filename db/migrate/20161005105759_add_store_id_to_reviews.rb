class AddStoreIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :store_id, :integer
  end
end
