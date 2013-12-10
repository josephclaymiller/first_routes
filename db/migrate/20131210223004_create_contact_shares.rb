class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id, :null => false
      t.integer :contact_id, :null => false
      t.timestamps
    end
  end
end
