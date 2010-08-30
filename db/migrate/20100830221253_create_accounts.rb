class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.timestamps
    end

    create_table :user_accounts do |t|
      t.integer :user_id
      t.integer :account_id
      t.string :role, :default => "user"
      t.timestamps
    end

    add_column :users, :current_account_id, :integer
  end

  def self.down
    remove_column :users, :current_account_id
    drop_table :user_accounts
    drop_table :accounts
  end
end
