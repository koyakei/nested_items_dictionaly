class Admin::ItemGradesDiscountsController < ApplicationController
  before_action :set_item_grades_discount, only: [:show, :update, :destroy]

  # GET /item_grades_discounts
  # GET /item_grades_discounts.json
  def index
    @item_grades_discounts = ItemGradesDiscount.all
  end

  # GET /item_grades_discounts/1
  # GET /item_grades_discounts/1.json
  def show
  end

  # POST /item_grades_discounts
  # POST /item_grades_discounts.json
  def create
    @item_grades_discount = ItemGradesDiscount.new(item_grades_discount_params)

    if @item_grades_discount.save
      render :show, status: :created, location: @item_grades_discount
    else
      render json: @item_grades_discount.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_grades_discounts/1
  # PATCH/PUT /item_grades_discounts/1.json
  def update
    if @item_grades_discount.update(item_grades_discount_params)
      render :show, status: :ok, location: @item_grades_discount
    else
      render json: @item_grades_discount.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_grades_discounts/1
  # DELETE /item_grades_discounts/1.json
  def destroy
    @item_grades_discount.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_grades_discount
      @item_grades_discount = ItemGradesDiscount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_grades_discount_params
      params.require(:item_grades_discount).permit(:item_id, :grade_id, :user_id, :discount_ration)
    end
end
