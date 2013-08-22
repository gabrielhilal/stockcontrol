class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
