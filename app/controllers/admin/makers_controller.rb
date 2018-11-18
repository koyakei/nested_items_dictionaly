class Admin::MakersController < ApplicationController
  before_action :set_admin_maker, only: [:show, :update, :destroy]

  # GET /admin/makers
  # GET /admin/makers.json
  def index
    @admin_makers = Admin::Maker.all
  end

  # GET /admin/makers/1
  # GET /admin/makers/1.json
  def show
  end

  # POST /admin/makers
  # POST /admin/makers.json
  def create
    @admin_maker = Admin::Maker.new(admin_maker_params)

    if @admin_maker.save
      render :show, status: :created, location: @admin_maker
    else
      render json: @admin_maker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/makers/1
  # PATCH/PUT /admin/makers/1.json
  def update
    if @admin_maker.update(admin_maker_params)
      render :show, status: :ok, location: @admin_maker
    else
      render json: @admin_maker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/makers/1
  # DELETE /admin/makers/1.json
  def destroy
    @admin_maker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_maker
      @admin_maker = Admin::Maker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_maker_params
      params.require(:admin_maker).permit(:name, :remarks, :url)
    end
end
