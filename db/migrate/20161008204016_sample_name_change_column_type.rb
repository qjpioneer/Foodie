class SampleNameChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  	change_column(:reviews, :rating, :float)
  end
end

