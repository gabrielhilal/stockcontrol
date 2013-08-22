class CreateSaleLines < ActiveRecord::Migration
  def change
    create_table :sale_lines do |t|
      t.integer :sale_id
      t.integer :beverage_id
      t.decimal :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
