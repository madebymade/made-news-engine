module News
  class Taxonomy < ActiveRecord::Base
    belongs_to :case_study, :class_name => 'News::Item'
    belongs_to :taxonomable, polymorphic: true

    attr_accessible :order, :news_item_id

    validates :news_item_id, :presence => true, :uniqueness => { :scope => [:taxonomable_id, :taxonomable_type] }

    default_scope :order => '`news_taxonomies`.`order` ASC'

    scope :to_categories, -> { where arel_table[:taxonomable_type].eq('News::Category') }
    scope :to_news_items, -> { where arel_table[:news_item_id].not_eq(nil) }
    scope :to_tags, -> { where arel_table[:taxonomable_type].eq('News::Tag') }
  end
end
