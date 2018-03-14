class ItemImagesController < ApplicationController
  before_action :set_item_image, only: [:show, :update, :destroy]

  # GET /item_images
  # GET /item_images.json
  def index
    @item_images = ItemImage.all
  end

  # GET /item_images/1
  # GET /item_images/1.json
  def show
  end

  # POST /item_images
  # POST /item_images.json
  def create
    @item_image = ItemImage.new(item_image_params)

    if @item_image.save
      render :show, status: :created, location: @item_image
    else
      render json: @item_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_images/1
  # PATCH/PUT /item_images/1.json
  def update
    if @item_image.update(item_image_params)
      render :show, status: :ok, location: @item_image
    else
      render json: @item_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_images/1
  # DELETE /item_images/1.json
  def destroy
    @item_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_image
      @item_image = ItemImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_image_params
      params.require(:item_image).permit(:item_id, :image_path, :name, :description)
    end
end
