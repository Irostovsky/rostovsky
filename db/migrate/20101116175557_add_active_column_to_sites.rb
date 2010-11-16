class AddActiveColumnToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :active, :boolean
  end

  def self.down
    remove_column :sites, :active
  end
end
