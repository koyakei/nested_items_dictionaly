class Admin::MakersController < ApplicationController
  before_action :set_maker, only: [:show, :update, :destroy]

  # GET /makers
  # GET /makers.json
  def index
    @makers = Maker.all
  end

  # GET /makers/1
  # GET /makers/1.json
  def show
  end

  # POST /makers
  # POST /makers.json
  def create
    @maker = Maker.new(maker_params)

    if @maker.save
      render :show, status: :created, location: @maker
    else
      render json: @maker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /makers/1
  # PATCH/PUT /makers/1.json
  def update
    if @maker.update(maker_params)
      render :show, status: :ok, location: @maker
    else
      render json: @maker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /makers/1
  # DELETE /makers/1.json
  def destroy
    @maker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maker
      @maker = Maker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maker_params
      params.require(:maker).permit(:maker_alias_id, :remarks, :url)
    end
end
