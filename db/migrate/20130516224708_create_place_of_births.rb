class CreatePlaceOfBirths < ActiveRecord::Migration
  def change
    create_table :place_of_births do |t|
      t.boolean :main_entry
      t.integer :uid
      t.string :place
      t.integer :sdn_id

      t.timestamps
    end
  end
end
