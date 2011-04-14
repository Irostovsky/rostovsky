class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :code
      t.string :title
      t.text :content
      t.boolean :visible, :default => false
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
