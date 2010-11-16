class GlobalizeSiteTitle < ActiveRecord::Migration
  def self.up
    add_column :site_translations, :title, :string
  end

  def self.down
    remove_column :site_translations, :title
  end
end
