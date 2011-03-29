class CreateBodyShapes < ActiveRecord::Migration
  def self.up
    create_table :body_shapes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :body_shapes
  end
end
