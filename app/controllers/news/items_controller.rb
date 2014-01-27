require_dependency "news/application_controller"

module News
  class ItemsController < News::ApplicationController
    def index
      @items = Item.all
    end

    def show
      if params[:preview] and params[:preview] == News.config.preview_token
        @item = Item.find_by_url!(params[:url])
      else
        @item = Item.find_by_url_and_published!(params[:url], true)
      end
    end

    def tag
      @tag = Tag.find_by_url!(params[:url])
    end
  end
end
