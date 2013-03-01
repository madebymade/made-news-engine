class AddStickyColumnToNews < ActiveRecord::Migration
  def change
    add_column :news_items, :sticky, :boolean
  end
end
