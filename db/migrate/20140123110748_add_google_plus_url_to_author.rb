class AddGooglePlusUrlToAuthor < ActiveRecord::Migration
  def change
    add_column :news_authors, :google_plus_url, :string
  end
end
