if News.config.engine_routing
  News::Engine.routes.draw do
    root                          :to => 'news#index',              :as => 'news'

    match '/tag/:url',            :to => 'news#tag',                :as => 'news_tag',         :via => [:get]
    match '/:url',                :to => 'news#show',               :as => 'news_item',        :via => [:get]
  end
end
