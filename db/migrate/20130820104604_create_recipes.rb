class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :product_id
      t.integer :beverage_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
