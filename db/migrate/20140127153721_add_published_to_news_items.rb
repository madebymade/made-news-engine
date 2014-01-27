class AddPublishedToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :published, :boolean, default: false
  end
end
