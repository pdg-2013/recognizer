class AddRelationsBetweenModels < ActiveRecord::Migration
  def up
  	add_column :addresses, :sdn_id, :integer
		add_column :programs,  :sdn_id, :integer
		add_column :akas,      :sdn_id, :integer
  end

  def down
  	remove_column :addresses, :sdn_id, :integer
		remove_column :programs,  :sdn_id, :integer
		remove_column :akas,      :sdn_id, :integer
  end
end
