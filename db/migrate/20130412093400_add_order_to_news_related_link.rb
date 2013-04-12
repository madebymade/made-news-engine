class AddOrderToNewsRelatedLink < ActiveRecord::Migration
  def change
    add_column :news_related_links, :order, :integer, :default => 9999
  end
end
