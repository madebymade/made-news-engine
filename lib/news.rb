require "news/engine"

module News
  mattr_accessor :engine_routing
  @@engine_routing = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

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
