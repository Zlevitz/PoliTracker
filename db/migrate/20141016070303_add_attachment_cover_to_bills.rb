class AddAttachmentCoverToBills < ActiveRecord::Migration
  def self.up
    change_table :bills do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :bills, :cover
  end
end
