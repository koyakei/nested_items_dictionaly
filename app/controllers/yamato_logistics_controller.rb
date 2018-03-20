class YamatoLogisticsController < ApplicationController
  before_action :set_yamato_logistic, only: [:show, :update, :destroy]

  # GET /yamato_logistics
  # GET /yamato_logistics.json
  def index
    @yamato_logistics = YamatoLogistic.all
  end

  # GET /yamato_logistics/1
  # GET /yamato_logistics/1.json
  def show
  end

  # POST /yamato_logistics
  # POST /yamato_logistics.json
  def create
    @yamato_logistic = YamatoLogistic.new(yamato_logistic_params)

    if @yamato_logistic.save
      render :show, status: :created, location: @yamato_logistic
    else
      render json: @yamato_logistic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /yamato_logistics/1
  # PATCH/PUT /yamato_logistics/1.json
  def update
    if @yamato_logistic.update(yamato_logistic_params)
      render :show, status: :ok, location: @yamato_logistic
    else
      render json: @yamato_logistic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /yamato_logistics/1
  # DELETE /yamato_logistics/1.json
  def destroy
    @yamato_logistic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamato_logistic
      @yamato_logistic = YamatoLogistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamato_logistic_params
      params.require(:yamato_logistic).permit(:item_id, :yamato_size_item_code_id, :yamato_packing_item_code_id, :yamato_handling_type_code_id)
    end
end
