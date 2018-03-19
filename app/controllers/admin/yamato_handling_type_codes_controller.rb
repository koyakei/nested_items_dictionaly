class Admin::YamatoHandlingTypeCodesController < ApplicationController
  before_action :set_admin_yamato_handling_type_code, only: [:show, :update, :destroy]

  # GET /admin/yamato_handling_type_codes
  # GET /admin/yamato_handling_type_codes.json
  def index
    @admin_yamato_handling_type_codes = Admin::YamatoHandlingTypeCode.all
  end

  # GET /admin/yamato_handling_type_codes/1
  # GET /admin/yamato_handling_type_codes/1.json
  def show
  end

  # POST /admin/yamato_handling_type_codes
  # POST /admin/yamato_handling_type_codes.json
  def create
    @admin_yamato_handling_type_code = Admin::YamatoHandlingTypeCode.new(admin_yamato_handling_type_code_params)

    if @admin_yamato_handling_type_code.save
      render :show, status: :created, location: @admin_yamato_handling_type_code
    else
      render json: @admin_yamato_handling_type_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/yamato_handling_type_codes/1
  # PATCH/PUT /admin/yamato_handling_type_codes/1.json
  def update
    if @admin_yamato_handling_type_code.update(admin_yamato_handling_type_code_params)
      render :show, status: :ok, location: @admin_yamato_handling_type_code
    else
      render json: @admin_yamato_handling_type_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/yamato_handling_type_codes/1
  # DELETE /admin/yamato_handling_type_codes/1.json
  def destroy
    @admin_yamato_handling_type_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_yamato_handling_type_code
      @admin_yamato_handling_type_code = Admin::YamatoHandlingTypeCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_yamato_handling_type_code_params
      params.require(:admin_yamato_handling_type_code).permit(:code, :name)
    end
end
