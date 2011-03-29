class CreateFabrics < ActiveRecord::Migration
  def self.up
    create_table :fabrics do |t|
      t.string :name
      t.integer :color_id
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :style_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :fabrics
  end
end
