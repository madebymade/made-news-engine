class CreateNewsRelatedLinks < ActiveRecord::Migration
  def change
    create_table :news_related_links do |t|
      t.string :title
      t.text   :text
      t.string :url
      t.attachment :image
      t.integer :news_item_id

      t.timestamps
    end
  end
end
