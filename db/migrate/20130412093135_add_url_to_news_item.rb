class AddUrlToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :url, :string
  end
end
