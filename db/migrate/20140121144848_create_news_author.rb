class CreateNewsAuthor < ActiveRecord::Migration
  def up
    create_table :news_authors do |t|
      t.text :bio
      t.string :name
      t.string :twitter
      t.string :type
      t.string :url

      t.timestamps
    end

    add_attachment :news_authors, :avatar

    add_index :news_authors, :url, unique: true
    add_index :news_authors, :type
  end

  def down
    remove_attachment :news_authors, :avatar
    drop_table :news_authors
  end
end
