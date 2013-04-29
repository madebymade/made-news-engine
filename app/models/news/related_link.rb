module News
  class RelatedLink < ActiveRecord::Base
    self.table_name = "news_related_links"

    belongs_to                      :item

    attr_accessible                 :title,
                                    :text,
                                    :url,
                                    :image,
                                    :order,
                                    :item_id

    has_attached_file               :image,
                                    :styles => {
                                       :thumb => News.config.image_size_thumb
                                    }

    validates_attachment_presence   :image

    validates_presence_of           :title,
                                    :text,
                                    :url,
                                    :image,
                                    :order
  end
end
