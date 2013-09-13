class CreateTransferStocks < ActiveRecord::Migration
  def change
    create_table :transfer_stocks do |t|
      t.date :date
      t.text :description
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :status

      t.timestamps
    end
  end
end
