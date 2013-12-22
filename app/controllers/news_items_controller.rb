class NewsItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    @selected_folder = 0
    news_items = nil
    if defined? params[:folder][:folder_id]
      unless params[:folder][:folder_id].nil? || params[:folder][:folder_id].empty?
        @selected_folder = params[:folder][:folder_id]
        query = NewsItem.joins("join folders_news_items on news_items.id = folders_news_items.news_item_id")
        my_query = query.where(:user_id => current_user.id)
        news_items = my_query.where(["folders_news_items.folder_id IN (?)", Folder.find(params[:folder][:folder_id]).subtree_ids]).distinct(:news_item)
      end
    end

    if news_items.nil?
      news_items = NewsItem.where(:user_id => current_user.id)
    end

    @news_items = news_items
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
    if defined? @news_item.folder.id
      @folder_title = Folder.find(@news_item.folder_id).title
    else
      @folder_title = "-"
    end
  end

  # Alle Meldungen (Feeds) aktualisieren.
  def synchronize
    RssSource.where(:user_id => current_user.id).each do |rss_source|

      if rss_source
        rss_source.update_from_feed current_user
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
    #@folder_id
    #@folders = [['-',nil]]
    #Folder.find_each do |folder|
    #  @folders.append [folder.title,folder.id]
    #end
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

  def keywords
    @pro_tags = TagPro.names_with_counts.where(:user_id => current_user.id)
    @contra_tags = TagContra.names_with_counts.where(:user_id => current_user.id)
  end

  # PATCH/PUT /news_items/1
  # PATCH/PUT /news_items/1.json
  def update
    @news_item.user = current_user
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

  def update_multiple
    unless defined? params['news_items']
      return redirect_to news_items_url, :notice => 'Keine zu speichernden Werte.'
    end

    params['news_items'].each do |news_item_id, news_item_values|
      unless "" == news_item_values['tag_pro'].strip
        news_item = NewsItem.find(news_item_id)
        news_item.tag_pro = TagPro.find_or_create_by(:name => news_item_values['tag_pro'].strip, :user_id => current_user.id)
        news_item.save
      end
      unless "" == news_item_values['tag_contra'].strip
        news_item = NewsItem.find(news_item_id)
        news_item.tag_contra = TagContra.find_or_create_by(:name => news_item_values['tag_contra'].strip, :user_id => current_user.id)
        news_item.save
      end
    end
    redirect_to news_items_url, :notice => 'Pro / Contra erfolgreich gespeichert.'
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
    params.require(:news_item).permit(
        :release_date,
        :vendor,
        :headline,
        :topic,
        :keywords,
        :web_url,
        :doc_url,
        :comment,
        :rss_source_id,
        :folder_ids => [:first, :second, :third]
    )
  end
end
