class AddRoleToAuthor < ActiveRecord::Migration
  def change
    add_column :news_authors, :role, :string
  end
end
