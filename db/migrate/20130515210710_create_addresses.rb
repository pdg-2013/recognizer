class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :uid
      t.string :address1
      t.string :city
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
