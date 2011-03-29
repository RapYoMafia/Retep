class CreateFeatureCategories < ActiveRecord::Migration
  def self.up
    create_table :feature_categories do |t|
      t.string :name

      t.timestamps
    end
    FeatureCategory.create :name => "collar"
    FeatureCategory.create :name => "cuffs"
    FeatureCategory.create :name => "placket"
    FeatureCategory.create :name => "pocket"
    FeatureCategory.create :name => "black pleates"
    FeatureCategory.create :name => "fit"
    FeatureCategory.create :name => "monogram"
  end

  def self.down
    drop_table :feature_categories
  end
end
