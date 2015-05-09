class UpdateTaxonomiesTable < ActiveRecord::Migration
  def change
    add_column :news_taxonomies, :order, :integer, :default => 9999
    rename_column :news_taxonomies, :tag_id, :taxonomable_id
    rename_column :news_taxonomies, :news_id, :news_item_id
    add_column :news_taxonomies, :taxonomable_type, :string, :default => 'News::Tag'
    add_column :news_taxonomies, :type, :string
  end
end
