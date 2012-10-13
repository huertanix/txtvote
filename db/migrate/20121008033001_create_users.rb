class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :phone, :null => false, :limit => 15 
      t.boolean :opt_in, :default => false

      t.timestamps
    end
    add_index :users, :phone
  end
end
