class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :update, :destroy]

  # GET /accessories
  # GET /accessories.json
  def index
    @accessories = Accessory.all
  end

  # GET /accessories/1
  # GET /accessories/1.json
  def show
  end

  # POST /accessories
  # POST /accessories.json
  def create
    @accessory = Accessory.new(accessory_params)

    if @accessory.save
      render :show, status: :created, location: @accessory
    else
      render json: @accessory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accessories/1
  # PATCH/PUT /accessories/1.json
  def update
    if @accessory.update(accessory_params)
      render :show, status: :ok, location: @accessory
    else
      render json: @accessory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def accessory_params
    params.require(:accessory).permit(:item_id)
  end
end
