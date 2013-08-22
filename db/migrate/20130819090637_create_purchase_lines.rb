class CreatePurchaseLines < ActiveRecord::Migration
  def change
    create_table :purchase_lines do |t|
      t.decimal :quantity
      t.decimal :price
      t.integer :purchase_id
      t.integer :product_id

      t.timestamps
    end
  end
end
