class AddAttachmentImageToSeshes < ActiveRecord::Migration
  def self.up
    change_table :seshes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :seshes, :image
  end
end
