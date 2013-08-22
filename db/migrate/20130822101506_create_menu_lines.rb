class CreateMenuLines < ActiveRecord::Migration
  def change
    create_table :menu_lines do |t|
      t.decimal :price
      t.integer :menu_id
      t.integer :beverage_id

      t.timestamps
    end
  end
end
