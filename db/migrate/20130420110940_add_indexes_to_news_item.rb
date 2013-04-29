class AddIndexesToNewsItem < ActiveRecord::Migration
  def change
    add_index :news_items, :url
    add_index :news_items, :sticky
    add_index :news_items, :created_at
  end
end
