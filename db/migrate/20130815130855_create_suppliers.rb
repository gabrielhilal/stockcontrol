class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
