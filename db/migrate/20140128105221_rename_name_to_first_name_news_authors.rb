class RenameNameToFirstNameNewsAuthors < ActiveRecord::Migration
  def change
    rename_column :news_authors, :name, :first_name
  end
end
