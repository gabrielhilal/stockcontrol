class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :measure
      t.decimal :quantity
      t.integer :product_category_id

      t.timestamps
    end
  end
end
