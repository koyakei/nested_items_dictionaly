class Admin::StandardUnitsController < ApplicationController
  before_action :set_admin_standard_unit, only: [:show, :update, :destroy]

  # GET /admin/standard_units
  # GET /admin/standard_units.json
  def index
    @admin_standard_units = Admin::StandardUnit.all
  end

  # GET /admin/standard_units/1
  # GET /admin/standard_units/1.json
  def show
  end

  # POST /admin/standard_units
  # POST /admin/standard_units.json
  def create
    @admin_standard_unit = Admin::StandardUnit.new(admin_standard_unit_params)

    if @admin_standard_unit.save
      render :show, status: :created, location: @admin_standard_unit
    else
      render json: @admin_standard_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/standard_units/1
  # PATCH/PUT /admin/standard_units/1.json
  def update
    if @admin_standard_unit.update(admin_standard_unit_params)
      render :show, status: :ok, location: @admin_standard_unit
    else
      render json: @admin_standard_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/standard_units/1
  # DELETE /admin/standard_units/1.json
  def destroy
    @admin_standard_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_standard_unit
      @admin_standard_unit = Admin::StandardUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_standard_unit_params
      params.require(:admin_standard_unit).permit(:unit)
    end
end
