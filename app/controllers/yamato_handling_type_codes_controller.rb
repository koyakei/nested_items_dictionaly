class YamatoHandlingTypeCodesController < ApplicationController
  before_action :set_yamato_handling_type_code, only: [:show, :update, :destroy]

  # GET /yamato_handling_type_codes
  # GET /yamato_handling_type_codes.json
  def index
    @yamato_handling_type_codes = YamatoHandlingTypeCode.all
  end

  # GET /yamato_handling_type_codes/1
  # GET /yamato_handling_type_codes/1.json
  def show
  end

  # POST /yamato_handling_type_codes
  # POST /yamato_handling_type_codes.json
  def create
    @yamato_handling_type_code = YamatoHandlingTypeCode.new(yamato_handling_type_code_params)

    if @yamato_handling_type_code.save
      render :show, status: :created, location: @yamato_handling_type_code
    else
      render json: @yamato_handling_type_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /yamato_handling_type_codes/1
  # PATCH/PUT /yamato_handling_type_codes/1.json
  def update
    if @yamato_handling_type_code.update(yamato_handling_type_code_params)
      render :show, status: :ok, location: @yamato_handling_type_code
    else
      render json: @yamato_handling_type_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /yamato_handling_type_codes/1
  # DELETE /yamato_handling_type_codes/1.json
  def destroy
    @yamato_handling_type_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamato_handling_type_code
      @yamato_handling_type_code = YamatoHandlingTypeCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamato_handling_type_code_params
      params.require(:yamato_handling_type_code).permit(:code, :name)
    end
end
