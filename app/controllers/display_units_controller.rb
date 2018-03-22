class DisplayUnitsController < ApplicationController
  before_action :set_display_unit, only: [:show, :update, :destroy]

  # GET /display_units
  # GET /display_units.json
  def index
    @display_units = DisplayUnit.all
  end

  # GET /display_units/1
  # GET /display_units/1.json
  def show
  end

  # POST /display_units
  # POST /display_units.json
  def create
    @display_unit = DisplayUnit.new(display_unit_params)

    if @display_unit.save
      render :show, status: :created, location: @display_unit
    else
      render json: @display_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /display_units/1
  # PATCH/PUT /display_units/1.json
  def update
    if @display_unit.update(display_unit_params)
      render :show, status: :ok, location: @display_unit
    else
      render json: @display_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /display_units/1
  # DELETE /display_units/1.json
  def destroy
    @display_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_display_unit
      @display_unit = DisplayUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def display_unit_params
      params.require(:display_unit).permit(:standard_unit_id, :name, :display_ratio)
    end
end
