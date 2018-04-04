# 商品の属性情報を管理する
#
# SQLによる特定商品に属する情報の検索の仕方
# SELECT
#     attribute_types.name AS attribute_name,
#     ROUND(CAST(value * display_ratio AS NUMERIC), 1) AS value,
#     display_units.name AS unit_name
# FROM
#    (SELECT * FROM item_attribute_types WHERE item_id = 4) AS base
#     LEFT OUTER JOIN
#         display_units
#         ON base.display_unit_id = display_units.id
#     LEFT OUTER JOIN
#         attribute_types
#         ON base.attribute_type_id = attribute_types.id
#
class ItemAttributeTypesController < ApplicationController
  before_action :set_item_attribute_type, only: [:show, :update, :destroy]

  # GET /item_attribute_types
  # GET /item_attribute_types.json
  def index
    @item_attribute_types = ItemAttributeType.all
  end

  # GET /item_attribute_types/1
  # GET /item_attribute_types/1.json
  def show
  end

  # POST /item_attribute_types
  # POST /item_attribute_types.json
  def create
    @item_attribute_type = ItemAttributeType.new(item_attribute_type_params)

    if @item_attribute_type.save
      render :show, status: :created, location: @item_attribute_type
    else
      render json: @item_attribute_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_attribute_types/1
  # PATCH/PUT /item_attribute_types/1.json
  def update
    if @item_attribute_type.update(item_attribute_type_params)
      render :show, status: :ok, location: @item_attribute_type
    else
      render json: @item_attribute_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_attribute_types/1
  # DELETE /item_attribute_types/1.json
  def destroy
    @item_attribute_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_attribute_type
      @item_attribute_type = ItemAttributeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_attribute_type_params
      params.require(:item_attribute_type).permit(:item_id, :attribute_type_id, :display_unit_id, :value)
    end
end
