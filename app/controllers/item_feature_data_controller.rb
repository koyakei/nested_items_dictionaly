class ItemFeatureDataController < ApplicationController
  before_action :set_item_feature_datum, only: [:show, :edit, :update, :destroy]

  # GET /item_feature_data
  # GET /item_feature_data.json
  def index
    @item_feature_data = ItemFeatureDatum.all
  end

  # GET /item_feature_data/1
  # GET /item_feature_data/1.json
  def show
  end

  # GET /item_feature_data/new
  def new
    @item_feature_datum = ItemFeatureDatum.new
  end

  # GET /item_feature_data/1/edit
  def edit
  end

  # POST /item_feature_data
  # POST /item_feature_data.json
  def create
    @item_feature_datum = ItemFeatureDatum.new(item_feature_datum_params)

    respond_to do |format|
      if @item_feature_datum.save
        format.html { redirect_to @item_feature_datum, notice: 'Item feature datum was successfully created.' }
        format.json { render :show, status: :created, location: @item_feature_datum }
      else
        format.html { render :new }
        format.json { render json: @item_feature_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_feature_data/1
  # PATCH/PUT /item_feature_data/1.json
  def update
    respond_to do |format|
      if @item_feature_datum.update(item_feature_datum_params)
        format.html { redirect_to @item_feature_datum, notice: 'Item feature datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_feature_datum }
      else
        format.html { render :edit }
        format.json { render json: @item_feature_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_feature_data/1
  # DELETE /item_feature_data/1.json
  def destroy
    @item_feature_datum.destroy
    respond_to do |format|
      format.html { redirect_to item_feature_data_url, notice: 'Item feature datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_feature_datum
      @item_feature_datum = ItemFeatureDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_feature_datum_params
      params.require(:item_feature_datum).permit(:item_id, :number, :feature)
    end
end
