class TagOrdersController < ApplicationController
  before_action :set_tag_order, only: [:show, :update, :destroy]

  # GET /tag_orders
  # GET /tag_orders.json
  def index
    @tag_orders = TagOrder.all
  end

  # GET /tag_orders/1
  # GET /tag_orders/1.json
  def show
  end

  # POST /tag_orders
  # POST /tag_orders.json
  def create
    @tag_order = TagOrder.new(tag_order_params)

    if @tag_order.save
      render :show, status: :created, location: @tag_order
    else
      render json: @tag_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tag_orders/1
  # PATCH/PUT /tag_orders/1.json
  def update
    if @tag_order.update(tag_order_params)
      render :show, status: :ok, location: @tag_order
    else
      render json: @tag_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tag_orders/1
  # DELETE /tag_orders/1.json
  def destroy
    @tag_order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_order
      @tag_order = TagOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_order_params
      params.require(:tag_order).permit(:name, :tag, :user, :order)
    end
end
