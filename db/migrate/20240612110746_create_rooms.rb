class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
    t.string :name
    t.boolean :is_private, :default => false
    t.text :user_ids, default: '[]' 

    t.timestamps

    end
  end
end
