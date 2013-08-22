class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :role
      t.integer :venue_id

      t.timestamps
    end
  end
end
