class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.string :follower_type
      t.integer :followed_id
      t.string :followed_type

      t.timestamps
    end
    add_index :relationships, [:follower_id, :follower_type]
    add_index :relationships, [:followed_id, :followed_type]
    add_index :relationships, [:follower_id, :follower_type, :followed_id, :followed_type], :unique => true, :name => 'index_relationships_on_follower_and_followed'
  end
end
