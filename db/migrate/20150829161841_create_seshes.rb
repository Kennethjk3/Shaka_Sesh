class CreateSeshes < ActiveRecord::Migration
  def change
    create_table :seshes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
