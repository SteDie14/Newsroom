class FoldersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.arrange_as_array({:order => :title}, Folder.where(:user_id => current_user.id).arrange)
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  # @FIXME: Move logic into model
  def new
    @folder = Folder.new
    folders = Folder.arrange_as_array({:order => 'title'}, Folder.where(:user_id => current_user.id))
    folders.each_with_index do |folder, index|
      unless folder.user_id == current_user.id && folder.depth < 2
        folders.delete_at(index)
      end
    end
    @folders = folders
  end

  # GET /folders/1/edit
  # @FIXME: Move Logic into model
  def edit
    folders = Folder.arrange_as_array({:order => 'title'}, @folder.possible_parents(current_user.id))
    folders.each_with_index do |folder, index|
      unless folder.user_id == current_user.id
        folders.delete_at(index)
      end
    end
    @folders = folders
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user

    respond_to do |format|
      if @folder.save
        format.html { redirect_to folders_url, notice: 'Folder was successfully created.' }
        format.json { render action: 'index', status: :created, location: @folder }
      else
        format.html { render action: 'new' }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:title, :parent_id)
    end
end
