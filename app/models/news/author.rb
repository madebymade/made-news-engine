require 'stringex'

module News
  class Author < ActiveRecord::Base
    self.table_name = "news_authors"

    has_many :items

    attr_accessible :avatar, :bio, :first_name, :google_plus_url, :role, :surname, :twitter, :url

    has_attached_file :avatar, :styles => News.config.image_styles

    acts_as_url :full_name

    validates_presence_of :first_name

    validates_uniqueness_of :url

    def full_name
      "#{self.first_name} #{self.surname}"
    end

    def to_param
      url
    end

    def to_s
      full_name
    end
  end
end
