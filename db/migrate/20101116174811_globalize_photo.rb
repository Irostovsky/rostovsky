class GlobalizePhoto < ActiveRecord::Migration
  def self.up
    Photo.create_translation_table! :description => :string
  end

  def self.down
    Photo.drop_translation_table!
  end
end
