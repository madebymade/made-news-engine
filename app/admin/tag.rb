if defined?(ActiveAdmin) and News.config.engine_active_admin
  ActiveAdmin.register News::Tag do

    filter :name
    filter :created_at

    menu :label => 'Tags', :parent => "News", :priority => 2

    action_item :only => :show do
      link_to "View on site", news_item_path(news_item.url)
    end

    controller do
      cache_sweeper  News.config.news_tag_sweeper if News.config.news_tag_sweeper
      defaults :finder => :find_by_url
    end

    form do |f|
      f.inputs "Tag" do
        f.input     :name,
                    :label => 'Tag name'

        f.input     :order
      end

      f.actions
    end

    index do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end
  end
end
