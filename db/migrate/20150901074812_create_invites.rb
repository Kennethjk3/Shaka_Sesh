class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :guest_id
      t.integer :attended_id

      t.timestamps null: false
    end
  end
end
