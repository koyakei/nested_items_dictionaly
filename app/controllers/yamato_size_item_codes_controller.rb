class YamatoSizeItemCodesController < ApplicationController
  before_action :set_yamato_size_item_code, only: [:show, :update, :destroy]

  # GET /yamato_size_item_codes
  # GET /yamato_size_item_codes.json
  def index
    @yamato_size_item_codes = YamatoSizeItemCode.all
  end

  # GET /yamato_size_item_codes/1
  # GET /yamato_size_item_codes/1.json
  def show
  end

  # POST /yamato_size_item_codes
  # POST /yamato_size_item_codes.json
  def create
    @yamato_size_item_code = YamatoSizeItemCode.new(yamato_size_item_code_params)

    if @yamato_size_item_code.save
      render :show, status: :created, location: @yamato_size_item_code
    else
      render json: @yamato_size_item_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /yamato_size_item_codes/1
  # PATCH/PUT /yamato_size_item_codes/1.json
  def update
    if @yamato_size_item_code.update(yamato_size_item_code_params)
      render :show, status: :ok, location: @yamato_size_item_code
    else
      render json: @yamato_size_item_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /yamato_size_item_codes/1
  # DELETE /yamato_size_item_codes/1.json
  def destroy
    @yamato_size_item_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamato_size_item_code
      @yamato_size_item_code = YamatoSizeItemCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamato_size_item_code_params
      params.require(:yamato_size_item_code).permit(:code, :name)
    end
end
