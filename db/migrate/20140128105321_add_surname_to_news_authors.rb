class AddSurnameToNewsAuthors < ActiveRecord::Migration
  def change
    add_column :news_authors, :surname, :string
  end
end
