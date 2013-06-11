class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :owner

      t.timestamps
    end
    add_index :rooms, :owner_id
  end
end
