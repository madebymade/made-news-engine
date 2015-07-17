require News::Engine.root.join('app', 'models', 'news', 'concerns', 'taxonomable')
require 'stringex'

module News
  class Tag < ActiveRecord::Base
    include News::Concerns::Taxonomable

    attr_accessible :name, :order, :intro_title, :intro_description

    default_scope :order => '`news_tags`.`order` ASC'

    acts_as_url :name

    def to_param
      url
    end

    def to_s
      name
    end
  end
end
