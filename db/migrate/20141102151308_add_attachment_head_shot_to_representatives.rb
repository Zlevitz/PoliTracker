class AddAttachmentHeadShotToRepresentatives < ActiveRecord::Migration
  def self.up
    change_table :representatives do |t|
      t.attachment :headshot
    end
  end

  def self.down
    remove_attachment :representatives, :headshot
  end
end
