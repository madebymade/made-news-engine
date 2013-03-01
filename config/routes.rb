News::Engine.routes.draw do
  resources :related_links
  resources :items

  root :to => "news#index"
end
