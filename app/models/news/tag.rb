require 'stringex'

module News
  class Tag < ActiveRecord::Base
    self.table_name = "news_tags"
    if News.config.engine_routing
      include News::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    has_many                        :taxonomies
    has_many                        :tag, :through => :taxonomies
    accepts_nested_attributes_for   :taxonomies, :allow_destroy => true

    after_destroy                   :remove_associations

    attr_accessible                 :name,
                                    :url

    acts_as_url                     :name

    default_scope                   :order => '`name` ASC'


    def to_param
      url
    end

    def to_s
      name
    end

    def get_canonical_url
      news_tag_path(self)
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
      New::Taxonomies.destroy_old_associations('tag', self.id)
    end
  end
end
