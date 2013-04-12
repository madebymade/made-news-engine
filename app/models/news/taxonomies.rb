module News
  class Taxonomies < ActiveRecord::Base

    attr_accessible               :item_id,
                                  :tag_id

    belongs_to                    :item
    belongs_to                    :tag

    def to_s
      self.tag
    end

    def self.destroy_old_associations(field, id)
      where("#{field}_id = ?", id).destroy_all
    end
  end
end
