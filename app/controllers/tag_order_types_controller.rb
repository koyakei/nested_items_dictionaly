class TagOrderTypesController < ApplicationController
  before_action :set_tag_order_type, only: [:show, :update, :destroy]

  # GET /tag_order_types
  # GET /tag_order_types.json
  def index
    @tag_order_types = TagOrderType.all
  end

  # GET /tag_order_types/1
  # GET /tag_order_types/1.json
  def show
  end

  # POST /tag_order_types
  # POST /tag_order_types.json
  def create
    @tag_order_type = TagOrderType.new(tag_order_type_params)

    if @tag_order_type.save
      render :show, status: :created, location: @tag_order_type
    else
      render json: @tag_order_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tag_order_types/1
  # PATCH/PUT /tag_order_types/1.json
  def update
    if @tag_order_type.update(tag_order_type_params)
      render :show, status: :ok, location: @tag_order_type
    else
      render json: @tag_order_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tag_order_types/1
  # DELETE /tag_order_types/1.json
  def destroy
    @tag_order_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_order_type
      @tag_order_type = TagOrderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_order_type_params
      params.require(:tag_order_type).permit(:name, :user_id, :description)
    end
end
