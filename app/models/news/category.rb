require News::Engine.root.join('app', 'models', 'news', 'concerns', 'taxonomable')
require 'stringex'

module News
  class Category < ActiveRecord::Base
    include News::Concerns::Taxonomable

    attr_accessible :name, :order, :url

    default_scope :order => '`news_categories`.`order` ASC'

    acts_as_url :name

    def to_param
      url
    end

    def to_s
      name
    end
  end
end