class NewsItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    no_filter = true
    @selected_folder1 = 0
    @selected_folder2 = 0
    @selected_folder3 = 0

    @selected_operator1 = 0
    @selected_operator2 = 0

    news_items = nil

    # 1. Kategorie
    if defined? params[:folder][:folder_id1]
      unless params[:folder][:folder_id1].nil? || params[:folder][:folder_id1].empty?
        no_filter = false
        @selected_folder1 = params[:folder][:folder_id1]
        query1 = NewsItem.joins(:folders).where(folders: {id: Folder.find(params[:folder][:folder_id1]).subtree_ids})
        query1 = query1.where(:user_id => current_user.id)
      end
    end

    # 2. Kategorie
    if defined? params[:folder][:folder_id2]
      unless params[:folder][:folder_id2].nil? || params[:folder][:folder_id2].empty?
        no_filter = false
        @selected_folder2 = params[:folder][:folder_id2]
        query2 = NewsItem.joins(:folders).where(folders: {id: Folder.find(params[:folder][:folder_id2]).subtree_ids})
        query2 = query2.where(:user_id => current_user.id)

        # Operator 1
        if defined? params[:folder][:operator1] && @selected_folder1.to_i > 0
          unless params[:folder][:operator1].nil? || params[:folder][:operator1].empty?
            @selected_operator1 = params[:folder][:operator1]
          end
        end
      end
    end

    # 3. Kategorie
    if defined? params[:folder][:folder_id3]
      unless params[:folder][:folder_id3].nil? || params[:folder][:folder_id3].empty?
        no_filter = false
        @selected_folder3 = params[:folder][:folder_id3]
        query3 = NewsItem.joins(:folders).where(folders: {id: Folder.find(params[:folder][:folder_id3]).subtree_ids})
        query3 = query3.where(:user_id => current_user.id)
        # Operator 1
        if defined? params[:folder][:operator2] && @selected_folder3.to_i > 0
          unless params[:folder][:operator2].nil? || params[:folder][:operator2].empty?
            @selected_operator2 = params[:folder][:operator2]
          end
        end
      end
    end

    # Auswerten
    unless query1.nil?

      # 1. Kategorie
      if @selected_folder1.to_i > 0
        query = query1

        # 1. und 2. Kategorie
        if @selected_folder2.to_i > 0
          if "and" == @selected_operator1
            query = query1 & query2
          end

          if "or" == @selected_operator1
            query = query1 | query2
          end

          if "xor" == @selected_operator1
            query = query1 + query2 - (query1 & query2)
          end

          #1. und 2. und 3. Kategorie
          if @selected_folder3.to_i > 0
            if "and" == @selected_operator2
              query = query & query3
            end

            if "or" == @selected_operator2
              query = query | query3
            end

            if "xor" == @selected_operator2
              query = query + query3 - (query & query3)
            end
          end
        end
      end


      news_items = query
    end

    if news_items.nil? && no_filter
      news_items = NewsItem.where(:user_id => current_user.id)
    end

    @folders = Folder.arrange_as_array({:order => 'title'}, Folder.where(:user_id => current_user.id))

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

    if params['news_items'].nil?
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
