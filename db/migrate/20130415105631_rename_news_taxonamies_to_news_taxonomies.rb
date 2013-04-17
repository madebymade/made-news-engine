class RenameNewsTaxonamiesToNewsTaxonomies < ActiveRecord::Migration
  def change
    rename_table :news_taxonamies, :news_taxonomies
  end
end
