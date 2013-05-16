class AddRemarksToSdns < ActiveRecord::Migration
  def change
    add_column :sdns, :remarks, :string
  end
end
