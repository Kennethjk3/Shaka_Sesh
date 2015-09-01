class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :name
      t.text :description
      t.string :address
      t.date :meet_date
      t.time :meet_time
      t.integer :creator_id


      t.timestamps null: false
    end
  end
end
