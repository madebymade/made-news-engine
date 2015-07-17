class CreateNewsTaxonamies < ActiveRecord::Migration
  def change
    create_table :news_taxonamies do |t|
      t.integer :news_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
