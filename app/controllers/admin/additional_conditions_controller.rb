class Admin::AdditionalConditionsController < ApplicationController
  before_action :set_additional_condition, only: [:show, :update, :destroy]

  # GET /additional_conditions
  # GET /additional_conditions.json
  def index
    @additional_conditions = AdditionalCondition.all
  end

  # GET /additional_conditions/1
  # GET /additional_conditions/1.json
  def show
  end

  # POST /additional_conditions
  # POST /additional_conditions.json
  def create
    @additional_condition = AdditionalCondition.new(additional_condition_params)

    if @additional_condition.save
      render :show, status: :created, location: @additional_condition
    else
      render json: @additional_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /additional_conditions/1
  # PATCH/PUT /additional_conditions/1.json
  def update
    if @additional_condition.update(additional_condition_params)
      render :show, status: :ok, location: @additional_condition
    else
      render json: @additional_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /additional_conditions/1
  # DELETE /additional_conditions/1.json
  def destroy
    @additional_condition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_condition
      @additional_condition = AdditionalCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_condition_params
      params.require(:additional_condition).permit(:name)
    end
end
