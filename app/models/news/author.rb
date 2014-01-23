require 'stringex'

module News
  class Author < ActiveRecord::Base
    self.table_name = "news_authors"

    has_many :items

    attr_accessible :avatar, :bio, :google_plus_url, :name, :role, :twitter, :url

    has_attached_file :avatar, :styles => News.config.image_styles

    acts_as_url :name

    validates_presence_of :bio, :name

    validates_uniqueness_of :url

    validates_attachment_presence :avatar

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
