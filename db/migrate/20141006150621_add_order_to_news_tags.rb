class AddOrderToNewsTags < ActiveRecord::Migration
  def change
    add_column :news_tags, :order, :integer, :default => 9999
  end
end
