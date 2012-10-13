class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.datetime :voted_at
      t.references :user

      t.timestamps
    end
    add_index :votes, :user_id
  end
end
