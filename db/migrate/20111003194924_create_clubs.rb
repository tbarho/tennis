class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.integer :owner_id
      t.text :bio
      t.text :contact_info

      t.timestamps
    end
  end
end
