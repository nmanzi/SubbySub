class LinksController < ApplicationController
  skip_before_filter :require_logon, :only => [:index, :show]
  # GET /links
  # GET /links.json
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    link = Link.find_by_subdomain!(request.subdomain)
    link.visits += 1
    link.save
    redirect_to link.url
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new
    @default_subdomain = @link.subdomain

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    @link.subdomain = params[:default_subdomain] if @link.subdomain.empty?

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, :flash => { :success => 'Subdomain created!' } }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to links_url, :flash => { :success => 'Subdomain updated!' } }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    
    respond_to do |format|
      format.html { redirect_to links_url, :flash => { :success => "Subdomain Destroyed!" } }
      format.json { head :ok }
    end
  end
end
