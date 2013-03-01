class AddAttachmentLeadImageToItems < ActiveRecord::Migration
  def self.up
    change_table :news_items do |t|
      t.attachment :lead_image
    end
  end

  def self.down
    drop_attached_file :news_items, :lead_image
  end
end
