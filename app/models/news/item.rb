module News
  class Item < ActiveRecord::Base
    self.table_name = "news_items"
    if News.config.engine_routing
      include News::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    attr_accessible                 :text, :title, :lead_image, :related_links_attributes, :sticky

    has_many                        :related_links

    accepts_nested_attributes_for   :related_links

    has_attached_file               :lead_image, :styles => {
                                        :sticky => "200x200#",
                                        :regular => "100x100#"
                                    }

    validates_presence_of           :title
    validates_presence_of           :text
    validates_presence_of           :lead_image

    def get_canonical_url
      news_item_path(self)
    end

    def get_parent
      "News"
    end

    def get_change_frequency
      "weekly"
    end

    def get_sitemap_priority
      "0.8"
    end

  end
end
