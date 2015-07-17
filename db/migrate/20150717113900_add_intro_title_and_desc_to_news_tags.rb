class AddIntroTitleAndDescToNewsTags < ActiveRecord::Migration
  def change
    add_column :news_tags, :intro_title, :string
    add_column :news_tags, :intro_description, :text
  end
end
