class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.float :neck_circum
      t.float :shoulder_width
      t.float :chest_circum
      t.float :front_armhole
      t.float :back_armhole
      t.float :waist_circum
      t.float :hip_circum
      t.float :shirt_length
      t.float :sleeve_length
      t.float :armhole_circum
      t.float :bicep_circum
      t.float :wrist_circum
      t.float :height_feet
      t.float :height_inches
      t.float :weight_lb
      t.string :shoulder
      t.string :chest
      t.string :body_shape

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
