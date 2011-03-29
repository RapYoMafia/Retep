class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.integer :feature_category_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
