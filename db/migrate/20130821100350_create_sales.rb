class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.text :summary
      t.integer :venue_id

      t.timestamps
    end
  end
end
