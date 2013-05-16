class CreatePlaceOfBirths < ActiveRecord::Migration
  def change
    create_table :place_of_births do |t|
      t.boolean :mainEntry
      t.integer :uid
      t.string :place
      t.integer :sdn_id

      t.timestamps
    end
  end
end
