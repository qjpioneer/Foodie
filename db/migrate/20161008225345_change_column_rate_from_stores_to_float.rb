class ChangeColumnRateFromStoresToFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column(:stores, :rate, :float)
  end
end
