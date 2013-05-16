class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.integer :sdn_id
      t.integer :uid
      t.string :country
      t.boolean :mainEntry

      t.timestamps
    end
  end
end
