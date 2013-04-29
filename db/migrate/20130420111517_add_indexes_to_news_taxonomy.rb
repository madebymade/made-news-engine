class AddIndexesToNewsTaxonomy < ActiveRecord::Migration
  def change
    add_index :news_taxonomies, :item_id
    add_index :news_taxonomies, :tag_id
  end
end
