class YamatoPackingItemCodesController < ApplicationController
  before_action :set_yamato_packing_item_code, only: [:show, :update, :destroy]

  # GET /yamato_packing_item_codes
  # GET /yamato_packing_item_codes.json
  def index
    @yamato_packing_item_codes = YamatoPackingItemCode.all
  end

  # GET /yamato_packing_item_codes/1
  # GET /yamato_packing_item_codes/1.json
  def show
  end

  # POST /yamato_packing_item_codes
  # POST /yamato_packing_item_codes.json
  def create
    @yamato_packing_item_code = YamatoPackingItemCode.new(yamato_packing_item_code_params)

    if @yamato_packing_item_code.save
      render :show, status: :created, location: @yamato_packing_item_code
    else
      render json: @yamato_packing_item_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /yamato_packing_item_codes/1
  # PATCH/PUT /yamato_packing_item_codes/1.json
  def update
    if @yamato_packing_item_code.update(yamato_packing_item_code_params)
      render :show, status: :ok, location: @yamato_packing_item_code
    else
      render json: @yamato_packing_item_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /yamato_packing_item_codes/1
  # DELETE /yamato_packing_item_codes/1.json
  def destroy
    @yamato_packing_item_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamato_packing_item_code
      @yamato_packing_item_code = YamatoPackingItemCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamato_packing_item_code_params
      params.require(:yamato_packing_item_code).permit(:code, :name)
    end
end
