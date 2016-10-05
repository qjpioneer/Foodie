class AddAttachmentImgToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :stores, :img
  end
end
