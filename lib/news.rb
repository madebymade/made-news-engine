require "news/engine"

module News
  mattr_accessor :engine_routing
  @@engine_routing = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :news_item_sweeper
  @@news_item_sweeper = false

  mattr_accessor :news_tag_sweeper
  @@news_tag_sweeper = false

  mattr_accessor :per_page
  @@per_page = 4

  mattr_accessor :image_size_main
  @@image_size_main = "200x200#"

  mattr_accessor :image_size_secondary
  @@image_size_secondary = "100x100#"

  mattr_accessor :image_size_thumb
  @@image_size_thumb = "70x70#"

  class Engine < Rails::Engine
    isolate_namespace News

    initializer :news do
      ActiveAdmin.application.load_paths.unshift Dir[News::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
