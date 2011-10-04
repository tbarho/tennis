class CreateClubProRelationships < ActiveRecord::Migration
  def change
    create_table :club_pro_relationships do |t|
      t.integer :club_id
      t.integer :pro_id

      t.timestamps
    end
    add_index :club_pro_relationships, :club_id
    add_index :club_pro_relationships, :pro_id
    add_index :club_pro_relationships, [:club_id, :pro_id], :unique => true
  end
end
