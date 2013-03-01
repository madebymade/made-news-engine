class ChangeColumnNameInRelatedLinks < ActiveRecord::Migration
  def change
    rename_column :news_related_links, :news_item_id, :item_id
  end
end
