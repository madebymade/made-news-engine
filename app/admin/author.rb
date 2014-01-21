if defined?(ActiveAdmin) and News.config.engine_active_admin
  ActiveAdmin.register News::Author, {:sort_order => :created_at} do
    controller do
      cache_sweeper News.config.news_author_sweeper if News.config.news_author_sweeper
      defaults :finder => :find_by_url
    end

    filter :name

    menu :label => 'Authors', :parent => "News", :priority => 3

    index do
      column :name
      column :bio
      column :avatar do |news_item|
        unless news_author.avatar.blank?
          image_tag news_author.avatar(:thumb)
        end
      end

      default_actions
    end

    form do |f|
      f.inputs "Author" do
        f.input :name
        f.input :bio
        f.input :avatar
        f.input :twitter
      end

      f.actions
    end
  end
end