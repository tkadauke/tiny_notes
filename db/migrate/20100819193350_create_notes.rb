class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
    
    add_index :notes, :created_at
  end

  def self.down
    drop_table :notes
  end
end
