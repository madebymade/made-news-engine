module News
  module Concerns
    module Taxonomable
      extend ActiveSupport::Concern

      included do
        attr_accessible :news_items, :taxonomies, :taxonomies_attributes

        has_many :taxonomies, :class_name => 'News::Taxonomy', :as => :taxonomable, :dependent => :destroy
        accepts_nested_attributes_for :taxonomies, :allow_destroy => true

        has_many :news_items, :class_name => 'News::Item', :through => :taxonomies

        scope :with_news_items, -> { includes(:taxonomies).merge(News::Taxonomy.to_news_items) }
      end
    end
  end
end