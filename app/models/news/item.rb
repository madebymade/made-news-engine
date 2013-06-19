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
    has_many                        :tags, :through => :taxonomies
    accepts_nested_attributes_for   :taxonomies, :allow_destroy => true

    after_destroy                   :remove_associations

    attr_accessible                 :text,
                                    :url,
                                    :title,
                                    :lead_image,
                                    :related_links_attributes,
                                    :sticky,
                                    :created_at,
                                    :updated_at,
                                    :tag_ids

    has_attached_file               :lead_image, :styles => {
                                        :main => News.config.image_size_main,
                                        :secondary => News.config.image_size_secondary,
                                        :thumb => News.config.image_size_thumb
                                    }

    acts_as_url                     :title

    default_scope                   :order => '`created_at` DESC'

    validates_presence_of           :title,
                                    :text

    validates_uniqueness_of         :url

    validates_attachment_presence   :lead_image

    def self.paginated(view_page)
      where('sticky != ?', true).page(view_page).per(News.config.per_page)
    end

    def self.get_sticky_post
      where('sticky = ?', true).first
    end

    def self.paginated_posts_with_tag(view_page, tag)
      taxonomies = News::Taxonomy.where(:tag_id => tag.id)
      item_ids = taxonomies.map {|x| x.item_id}
      self.where(:id => item_ids).page(view_page).per(News.config.per_page)
    end

    def self.paginated_posts_archive(view_page, year, month)
      date = DateTime.strptime("#{month} #{year}", "%B %Y")
      where("created_at between ? AND ?", date.beginning_of_month, date.end_of_month).page(view_page).per(News.config.per_page)
    end

    def self.get_items_year_month_hash
      posts_by_year = self.all.group_by { |post| post.created_at.strftime("%Y") }

      posts_by_year.each do |year, posts|
        posts_by_year[year] = posts.group_by { |post| post.created_at.strftime("%B") }
      end

      posts_by_year
    end

    def to_param
      url
    end

    def to_s
      title
    end

    def get_canonical_url
      news_item_path(self.url)
    end

    def get_sitemap_title
      self.title
    end

    def get_sitemap_priority
      "0.8"
    end

    def get_change_frequency
      "weekly"
    end

    def get_parent
      "News"
    end

    def get_parent_url
      news_path
    end

    private
    def remove_associations
      unless self.tags.blank?
        News::Taxonomy.destroy_old_associations('item', self.id)
      end
    end
  end
end
