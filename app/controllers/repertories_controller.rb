class RepertoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_show]
  before_action :set_repertory, only: %i[show public_show edit update destroy]

  # GET /repertories or /repertories.json
  def index
    @repertories = Repertory.all
  end

  # GET /repertories/1 or /repertories/1.json
  def show; end

  def public_show
    self.class.layout 'public'
  end

  # GET /repertories/new
  def new
    @repertory = Repertory.new

    selected_musics_ids = session[:repertory_selected_musics_ids] || []
    @selected_musics = Music.where(id: selected_musics_ids) unless selected_musics_ids.empty?
  end

  # GET /repertories/1/edit
  def edit; end

  # POST /repertories or /repertories.json
  def create
    @repertory = Repertory.new(repertory_params)
    @repertory.user = current_user

    respond_to do |format|
      if @repertory.save
        format.html do
          redirect_to root_path, notice: t('activerecord.flash.created', model: Repertory.model_name.human)
        end
        format.json { render :show, status: :created, location: @repertory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repertory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repertories/1 or /repertories/1.json
  def update
    @repertory.musics = music_from_params

    respond_to do |format|
      if @repertory.update(repertory_params)
        format.html do
          redirect_to root_path, notice: t('activerecord.flash.updated', model: Repertory.model_name.human)
        end
        format.json { render :show, status: :ok, location: @repertory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repertory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repertories/1 or /repertories/1.json
  def destroy
    @repertory.destroy

    respond_to do |format|
      format.html do
        redirect_to root_path, notice: t('activerecord.flash.destroyed', model: Repertory.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  def music_from_params
    Music.where(id: params[:repertory][:music_ids])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_repertory
    @repertory = Repertory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def repertory_params
    params.require(:repertory).permit(:name)
  end
end
