class ItemAttributesController < ApplicationController
  before_action :set_item_attribute, only: [:show, :update, :destroy]

  # GET /item_attributes
  # GET /item_attributes.json
  def index
    @item_attributes = ItemAttribute.all
  end

  # GET /item_attributes/1
  # GET /item_attributes/1.json
  def show
  end

  # POST /item_attributes
  # POST /item_attributes.json
  def create
    @item_attribute = ItemAttribute.new(item_attribute_params)

    if @item_attribute.save
      render :show, status: :created, location: @item_attribute
    else
      render json: @item_attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_attributes/1
  # PATCH/PUT /item_attributes/1.json
  def update
    if @item_attribute.update(item_attribute_params)
      render :show, status: :ok, location: @item_attribute
    else
      render json: @item_attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_attributes/1
  # DELETE /item_attributes/1.json
  def destroy
    @item_attribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_attribute
      @item_attribute = ItemAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_attribute_params
      params.require(:item_attribute).permit(:item_id, :attribute_id, :display_unit_id, :value)
    end
end
