class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :description
      t.integer :vote_code, :null => false
      t.boolean :active, :default => true

      t.timestamps
    end
    
    add_index :things, :vote_code
  end
end
