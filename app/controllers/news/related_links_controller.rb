require_dependency "news/application_controller"

module News
  class RelatedLinksController < ApplicationController
    # GET /related_links
    # GET /related_links.json
    def index
      @related_links = RelatedLink.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @related_links }
      end
    end
  
    # GET /related_links/1
    # GET /related_links/1.json
    def show
      @related_link = RelatedLink.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @related_link }
      end
    end
  
    # GET /related_links/new
    # GET /related_links/new.json
    def new
      @related_link = RelatedLink.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @related_link }
      end
    end
  
    # GET /related_links/1/edit
    def edit
      @related_link = RelatedLink.find(params[:id])
    end
  
    # POST /related_links
    # POST /related_links.json
    def create
      @related_link = RelatedLink.new(params[:related_link])
  
      respond_to do |format|
        if @related_link.save
          format.html { redirect_to @related_link, notice: 'Related link was successfully created.' }
          format.json { render json: @related_link, status: :created, location: @related_link }
        else
          format.html { render action: "new" }
          format.json { render json: @related_link.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /related_links/1
    # PUT /related_links/1.json
    def update
      @related_link = RelatedLink.find(params[:id])
  
      respond_to do |format|
        if @related_link.update_attributes(params[:related_link])
          format.html { redirect_to @related_link, notice: 'Related link was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @related_link.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /related_links/1
    # DELETE /related_links/1.json
    def destroy
      @related_link = RelatedLink.find(params[:id])
      @related_link.destroy
  
      respond_to do |format|
        format.html { redirect_to related_links_url }
        format.json { head :no_content }
      end
    end
  end
end
