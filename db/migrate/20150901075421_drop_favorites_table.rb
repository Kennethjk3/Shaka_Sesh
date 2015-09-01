class DropFavoritesTable < ActiveRecord::Migration
  def up
     drop_table :favorties
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
 
end
