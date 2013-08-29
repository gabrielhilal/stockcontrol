class CreateTransferLines < ActiveRecord::Migration
  def change
    create_table :transfer_lines do |t|
      t.integer :transfer_stock_id
      t.integer :product_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
