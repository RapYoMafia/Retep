class CreateShoulders < ActiveRecord::Migration
  def self.up
    create_table :shoulders do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :shoulders
  end
end
