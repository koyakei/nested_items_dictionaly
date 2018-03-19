class Admin::YamatoSizeItemCodesController < ApplicationController
  before_action :set_admin_yamato_size_item_code, only: [:show, :update, :destroy]

  # GET /admin/yamato_size_item_codes
  # GET /admin/yamato_size_item_codes.json
  def index
    @admin_yamato_size_item_codes = Admin::YamatoSizeItemCode.all
  end

  # GET /admin/yamato_size_item_codes/1
  # GET /admin/yamato_size_item_codes/1.json
  def show
  end

  # POST /admin/yamato_size_item_codes
  # POST /admin/yamato_size_item_codes.json
  def create
    @admin_yamato_size_item_code = Admin::YamatoSizeItemCode.new(admin_yamato_size_item_code_params)

    if @admin_yamato_size_item_code.save
      render :show, status: :created, location: @admin_yamato_size_item_code
    else
      render json: @admin_yamato_size_item_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/yamato_size_item_codes/1
  # PATCH/PUT /admin/yamato_size_item_codes/1.json
  def update
    if @admin_yamato_size_item_code.update(admin_yamato_size_item_code_params)
      render :show, status: :ok, location: @admin_yamato_size_item_code
    else
      render json: @admin_yamato_size_item_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/yamato_size_item_codes/1
  # DELETE /admin/yamato_size_item_codes/1.json
  def destroy
    @admin_yamato_size_item_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_yamato_size_item_code
      @admin_yamato_size_item_code = Admin::YamatoSizeItemCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_yamato_size_item_code_params
      params.require(:admin_yamato_size_item_code).permit(:code, :name)
    end
end
