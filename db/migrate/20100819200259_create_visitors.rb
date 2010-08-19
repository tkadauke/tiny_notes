class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.string :cookie_id
      t.timestamps
    end
    
    add_index :visitors, :cookie_id
  end

  def self.down
    drop_table :visitors
  end
end
