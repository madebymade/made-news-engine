require 'stringex'

module News
  class Item < ActiveRecord::Base
    self.table_name = "news_items"
    if News.config.engine_routing
      include News::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    has_many                        :related_links
    accepts_nested_attributes_for   :related_links, :allow_destroy => true

    has_many                        :taxonomies
    has_many                        :tag, :through => :taxonomies
    accepts_nested_attributes_for   :taxonomies, :allow_destroy => true

    after_destroy                   :remove_associations

    attr_accessible                 :text,
                                    :url,
                                    :title,
                                    :lead_image,
                                    :related_links_attributes,
                                    :sticky,
                                    :created_at

    has_attached_file               :lead_image, :styles => {
                                        :main => News.config.image_size_main,
                                        :secondary => News.config.image_size_secondary,
                                        :thumb => News.config.image_size_thumb
                                    }

    acts_as_url                     :title

    default_scope                   :order => '`created_at` DESC'

    validates_presence_of           :title,
                                    :text,
                                    :lead_image

    validates_attachment_presence   :lead_image

    def self.paginated(view_page)
      where('sticky != ?', true).page view_page
    end

    def to_param
      url
    end

    def to_s
      title
    end

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

    private
    def remove_associations
      New::Taxonomies.destroy_old_associations('item', self.id)
    end
  end
end
