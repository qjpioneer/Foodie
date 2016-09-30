class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :phone
      t.integer :rate
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
