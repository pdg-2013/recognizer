class CreateDateOfBirths < ActiveRecord::Migration
  def change
    create_table :date_of_births do |t|
      t.boolean :main_entry
      t.integer :uid
      t.string :date
      t.integer :sdn_id

      t.timestamps
    end
  end
end
