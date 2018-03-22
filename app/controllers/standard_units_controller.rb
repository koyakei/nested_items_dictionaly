class StandardUnitsController < ApplicationController
  before_action :set_standard_unit, only: [:show, :update, :destroy]

  # GET /standard_units
  # GET /standard_units.json
  def index
    @standard_units = StandardUnit.all
  end

  # GET /standard_units/1
  # GET /standard_units/1.json
  def show
  end

  # POST /standard_units
  # POST /standard_units.json
  def create
    @standard_unit = StandardUnit.new(standard_unit_params)

    if @standard_unit.save
      render :show, status: :created, location: @standard_unit
    else
      render json: @standard_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /standard_units/1
  # PATCH/PUT /standard_units/1.json
  def update
    if @standard_unit.update(standard_unit_params)
      render :show, status: :ok, location: @standard_unit
    else
      render json: @standard_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /standard_units/1
  # DELETE /standard_units/1.json
  def destroy
    @standard_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard_unit
      @standard_unit = StandardUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_unit_params
      params.require(:standard_unit).permit(:name)
    end
end
