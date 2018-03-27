class AttributeTypesController < ApplicationController
  before_action :set_attribute_type, only: [:show, :update, :destroy]

  # GET /attribute_types
  # GET /attribute_types.json
  def index
    @attribute_types = AttributeType.all
  end

  # GET /attribute_types/1
  # GET /attribute_types/1.json
  def show
  end

  # POST /attribute_types
  # POST /attribute_types.json
  def create
    @attribute_type = AttributeType.new(attribute_params)

    if @attribute_type.save
      render :show, status: :created, location: @attribute_type
    else
      render json: @attribute_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attribute_types/1
  # PATCH/PUT /attribute_types/1.json
  def update
    if @attribute_type.update(attribute_params)
      render :show, status: :ok, location: @attribute_type
    else
      render json: @attribute_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attribute_types/1
  # DELETE /attribute_types/1.json
  def destroy
    @attribute_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_type
      @attribute_type = AttributeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_params
      params.require(:attribute_type).permit(:standard_unit_id, :name)
    end
end
