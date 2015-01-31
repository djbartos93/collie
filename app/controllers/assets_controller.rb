class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy, :print_label]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.all.page params[:page]
    authorize! :index, Asset

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
      format.csv { send_data @assets.to_csv, filename: "assets-#{Time.now.strftime('%Y%m%dT%H%M%S')}.csv",  type: 'application/csv'}
    end
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    authorize! :show, @asset

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  def new
    authorize! :new, Asset

    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit
    authorize! :edit, @asset
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)
    authorize! :create, @asset

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    authorize! :update, @asset

    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    authorize! :destroy, @asset

    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  # GET /assets/1/print
  # GET /assets/1/print.json
  def print_label
    authorize! :update, @asset

    @asset.current_tag.print_label

    respond_to do |format|
      format.html { redirect_to @asset, notice: 'Tag queued for printing' }
      format.json { head :no_content }
    end
  end

  # POST /assets/1/new_tag
  # POST /assets/1/new_tag.json
  def new_tag
    authorize! :update, @asset

    @asset.asset_tags.create!

    respond_to do |format|
      format.html { redirect_to @asset, notice: 'New tag created' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:asset_name, :serial_number, :purchase_date, :cost, :status, :notes)
    end
end
