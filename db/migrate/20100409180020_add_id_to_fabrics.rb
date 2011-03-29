class AddIdToFabrics < ActiveRecord::Migration
  def self.up
    add_column :fabrics, :fabric_number, :string
  end

  def self.down
    remove_column :fabrics, :fabric_number
  end
end
