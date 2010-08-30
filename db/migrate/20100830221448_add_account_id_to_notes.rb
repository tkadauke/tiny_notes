class AddAccountIdToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :account_id, :integer
    add_index :notes, :account_id
  end

  def self.down
    remove_column :notes, :account_id
  end
end
