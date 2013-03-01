if defined?(ActiveAdmin)

  ActiveAdmin.register News::Item do
    # controller do
    #   cache_sweeper News.config.cache_sweeper if News.config.cache_sweeper
    # end

    menu :label => 'Manage News Items', :parent => "News"

    index do
      column :title
      column :created_at
      column :updated_at
      column :text
      column :lead_image do |news_item|
        unless news_item.lead_image.blank?
          image_tag news_item.lead_image(:original)
        end
      end
      column :sticky

      default_actions
    end

    form do |f|
      f.inputs "News Item" do
        f.input :title
        f.input :text
        f.input :lead_image, :as => :file
        f.has_many :related_links do |f_link|
          f_link.inputs do
            f_link.input :title
            f_link.input :text
            f_link.input :url, :input_html => {:placeholder => "http://www.example.com"}
            f_link.input :image, :as => :file
          end
        end
      end

      f.buttons
    end
    
  end

end
