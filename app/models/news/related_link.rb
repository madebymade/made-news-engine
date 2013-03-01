module News
  class RelatedLink < ActiveRecord::Base
    self.table_name = "news_related_links"

    attr_accessible :title, :text, :url, :image

    belongs_to :item

    has_attached_file     :image, :styles => {
                                        :small => "100x100#"
                                    }

    validates_presence_of :title
    validates_presence_of :text
    validates_presence_of :url
    validates_presence_of :image
  end
end
