class GlobalizeSite < ActiveRecord::Migration
  def self.up
    Site.create_translation_table! :description => :string
  end

  def self.down
    Site.drop_translation_table!
  end
end
