class DropSeshesTable < ActiveRecord::Migration
  def up
     drop_table :seshes
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
 end
