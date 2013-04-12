class RemoveOddPaperclipBinding < ActiveRecord::Migration
  def change
    drop_attached_file :news_items, :lead_image
    drop_attached_file :news_related_links, :image

    add_attachment :news_items, :lead_image
    add_attachment :news_related_links, :image
  end
end
