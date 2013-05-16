class CreateAkas < ActiveRecord::Migration
  def change
    create_table :akas do |t|
      t.integer :uid
      t.string :type
      t.string :category
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
