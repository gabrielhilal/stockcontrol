class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.string :name
      t.text :description
      t.text :method
      t.string :glass
      t.string :garnish
      t.integer :beverage_category_id

      t.timestamps
    end
  end
end
