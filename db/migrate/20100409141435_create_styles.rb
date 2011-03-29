class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.string :name

      t.timestamps
    end
    Style.create :name => "check"
    Style.create :name => "stripes"
    Style.create :name => "plain"
    Style.create :name => "patterned"
    Style.create :name => "stretch"
    Style.create :name => "linen"
    Style.create :name => "premium"
  end

  def self.down
    drop_table :styles
  end
end
