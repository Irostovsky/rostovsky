class AddViewColumnToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :url, :string
    add_column :sites, :description, :text
    add_column :sites, :position, :integer
  end

  def self.down
    remove_column :sites, :url
    remove_column :sites, :description
    remove_column :sites, :position
  end
end
