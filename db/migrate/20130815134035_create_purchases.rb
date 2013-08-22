class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :date
      t.string :no
      t.integer :venue_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
