class CostsForItemsController < ApplicationController
  before_action :set_costs_for_item, only: [:show, :update, :destroy]

  # GET /costs_for_items
  # GET /costs_for_items.json
  def index
    @costs_for_items = CostsForItem.all
  end

  # GET /costs_for_items/1
  # GET /costs_for_items/1.json
  def show
  end

  # POST /costs_for_items
  # POST /costs_for_items.json
  def create
    @costs_for_item = CostsForItem.new(costs_for_item_params)

    if @costs_for_item.save
      render :show, status: :created, location: @costs_for_item
    else
      render json: @costs_for_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /costs_for_items/1
  # PATCH/PUT /costs_for_items/1.json
  def update
    if @costs_for_item.update(costs_for_item_params)
      render :show, status: :ok, location: @costs_for_item
    else
      render json: @costs_for_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /costs_for_items/1
  # DELETE /costs_for_items/1.json
  def destroy
    @costs_for_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costs_for_item
      @costs_for_item = CostsForItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def costs_for_item_params
      params.require(:costs_for_item).permit(:user_id, :item_id, :cost_ratio, :selling_cost, :freight_cost_in, :freight_cost_out, :storage_cost)
    end
end
