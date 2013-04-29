class AddIndexesToNewsTag < ActiveRecord::Migration
  def change
    add_index :news_tags, :url
  end
end
