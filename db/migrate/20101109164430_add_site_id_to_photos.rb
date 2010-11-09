class AddSiteIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :site_id, :integer
  end

  def self.down
    remove_column :photos, :site_id
  end
end
