class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.string :name

      t.timestamps
    end
    Color.create :name => "black"
    Color.create :name => "blue"
    Color.create :name => "brown"
    Color.create :name => "green"
    Color.create :name => "grey"
    Color.create :name => "lavender"
    Color.create :name => "navy"
    Color.create :name => "orange"
    Color.create :name => "pink"
    Color.create :name => "purple"
    Color.create :name => "red"
    Color.create :name => "white"
    Color.create :name => "yellow"
  end

  def self.down
    drop_table :colors
  end
end
