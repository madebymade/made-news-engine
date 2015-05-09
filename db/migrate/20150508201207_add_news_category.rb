class AddNewsCategory < ActiveRecord::Migration
  def up
    create_table :news_categories do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    add_column :news_categories, :type, :string
    add_column :news_categories, :order, :integer, default: 9999
    add_index :news_categories, :order
    add_index :news_categories, :type
  end
end
