class FixContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :contact_id
    add_column :contacts, :name, :string
    add_column :contacts, :email, :string

    create_table :contact_shares do |t|
      t.integer :user_id, :null => false
      t.integer :contact_id, :null => false
      t.timestamps
    end
  end
end
