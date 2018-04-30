class Admin::ItemAdditionalConditionsController < ApplicationController
  before_action :set_item_additional_condition, only: [:show, :update, :destroy]

  # GET /item_additional_conditions
  # GET /item_additional_conditions.json
  def index
    @item_additional_conditions = ItemAdditionalCondition.all
  end

  # GET /item_additional_conditions/1
  # GET /item_additional_conditions/1.json
  def show
  end

  # POST /item_additional_conditions
  # POST /item_additional_conditions.json
  def create
    @item_additional_condition = ItemAdditionalCondition.new(item_additional_condition_params)

    if @item_additional_condition.save
      render :show, status: :created, location: @item_additional_condition
    else
      render json: @item_additional_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_additional_conditions/1
  # PATCH/PUT /item_additional_conditions/1.json
  def update
    if @item_additional_condition.update(item_additional_condition_params)
      render :show, status: :ok, location: @item_additional_condition
    else
      render json: @item_additional_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_additional_conditions/1
  # DELETE /item_additional_conditions/1.json
  def destroy
    @item_additional_condition.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_additional_condition
    @item_additional_condition = ItemAdditionalCondition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_additional_condition_params
    params.require(:item_additional_condition).permit(:item_id,
                                                      :additional_condition_id,
                                                      :discount_ratio)
  end
end
