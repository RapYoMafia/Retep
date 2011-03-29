class AddAttachmentsPhotoToBodyShape < ActiveRecord::Migration
  def self.up
    add_column :body_shapes, :photo_file_name, :string
    add_column :body_shapes, :photo_content_type, :string
    add_column :body_shapes, :photo_file_size, :integer
    add_column :body_shapes, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :body_shapes, :photo_file_name
    remove_column :body_shapes, :photo_content_type
    remove_column :body_shapes, :photo_file_size
    remove_column :body_shapes, :photo_updated_at
  end
end
