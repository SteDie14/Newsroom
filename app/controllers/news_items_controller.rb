class NewsItemsController < ApplicationController
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.all
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
  end

  # Alle Meldungen (Feeds) aktualisieren.
  def synchronize
    rss_sources = RssSource.find_each do |rss_source|

      if rss_source
        rss_source.update_from_feed
      end
    end
    return redirect_to :action => :index
  end

  # GET /news_items/new
  def new
    @news_item = NewsItem.new
  end

  # GET /news_items/1/edit
  def edit
  end

  # POST /news_items
  # POST /news_items.json
  def create
    @news_item = NewsItem.new(news_item_params)

    respond_to do |format|
      if @news_item.save
        format.html { redirect_to @news_item, notice: 'News item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @news_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @news_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_items/1
  # PATCH/PUT /news_items/1.json
  def update
    respond_to do |format|
      if @news_item.update(news_item_params)
        format.html { redirect_to @news_item, notice: 'News item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.json
  def destroy
    @news_item.destroy
    respond_to do |format|
      format.html { redirect_to news_items_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_item_params
    params.require(:news_item).permit(:release_date, :vendor, :headline, :topic, :keywords, :web_url, :doc_url, :comment, :RssSource_id)
  end
end
