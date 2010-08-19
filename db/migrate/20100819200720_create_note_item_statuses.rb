class CreateNoteItemStatuses < ActiveRecord::Migration
  def self.up
    create_table :note_item_statuses do |t|
      t.integer :note_id
      t.integer :visitor_id
      t.string :item_id
      t.boolean :status, :default => false
      t.timestamps
    end
    
    add_index :note_item_statuses, [:note_id, :visitor_id]
  end

  def self.down
    drop_table :note_item_statuses
  end
end
