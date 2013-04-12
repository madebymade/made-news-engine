require_dependency "news/application_controller"

module News
  class ItemsController < News::ApplicationController
    def index
      @items = Item.all
    end

    def show
      @item = Item.find_by_url!(params[:url])
    end

    def tag
      @tag = Tag.find_by_url!(params[:url])
    end
  end
end
