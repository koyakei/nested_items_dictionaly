class TagItemsController < ApplicationController
  before_action :set_tag_item, only: [:show, :update, :destroy]

  # GET /tag_items
  # GET /tag_items.json
  def index
    @tag_items = TagItem.all
  end

  # GET /tag_items/1
  # GET /tag_items/1.json
  def show
  end

  # POST /tag_items
  # POST /tag_items.json
  def create
    @tag_item = TagItem.new(tag_item_params)

    if @tag_item.save
      render :show, status: :created, location: @tag_item
    else
      render json: @tag_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tag_items/1
  # PATCH/PUT /tag_items/1.json
  def update
    if @tag_item.update(tag_item_params)
      render :show, status: :ok, location: @tag_item
    else
      render json: @tag_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tag_items/1
  # DELETE /tag_items/1.json
  def destroy
    @tag_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_item
      @tag_item = TagItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_item_params
      params.require(:tag_item).permit(:tag, :item, :user_id)
    end
end
