class AddPublicToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :public, :boolean, :default => true

    add_index :notes, :public
  end

  def self.down
    remove_column :notes, :public
  end
end
