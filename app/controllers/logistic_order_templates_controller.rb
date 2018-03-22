class LogisticOrderTemplatesController < ApplicationController
  before_action :set_logistic_order_template, only: [:show, :update, :destroy]

  # GET /logistic_order_templates
  # GET /logistic_order_templates.json
  def index
    @logistic_order_templates = LogisticOrderTemplate.all
  end

  # GET /logistic_order_templates/1
  # GET /logistic_order_templates/1.json
  def show
  end

  # POST /logistic_order_templates
  # POST /logistic_order_templates.json
  def create
    @logistic_order_template = LogisticOrderTemplate.new(logistic_order_template_params)

    if @logistic_order_template.save
      render :show, status: :created, location: @logistic_order_template
    else
      render json: @logistic_order_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logistic_order_templates/1
  # PATCH/PUT /logistic_order_templates/1.json
  def update
    if @logistic_order_template.update(logistic_order_template_params)
      render :show, status: :ok, location: @logistic_order_template
    else
      render json: @logistic_order_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logistic_order_templates/1
  # DELETE /logistic_order_templates/1.json
  def destroy
    @logistic_order_template.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logistic_order_template
      @logistic_order_template = LogisticOrderTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logistic_order_template_params
      params.require(:logistic_order_template).permit(:item_id, :logistic_order_templateable_id)
    end
end
