class CreateNewsTags < ActiveRecord::Migration
  def change
    create_table :news_tags do |t|
      t.string      :name
      t.string      :url

      t.timestamps
    end
  end
end
