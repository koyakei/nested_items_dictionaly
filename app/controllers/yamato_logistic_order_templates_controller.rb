class YamatoLogisticOrderTemplatesController < ApplicationController
  before_action :set_yamato_logistic_order_template, only: [:show, :update, :destroy]

  # GET /yamato_logistic_order_templates
  # GET /yamato_logistic_order_templates.json
  def index
    @yamato_logistic_order_templates = YamatoLogisticOrderTemplate.all
  end

  # GET /yamato_logistic_order_templates/1
  # GET /yamato_logistic_order_templates/1.json
  def show
  end

  # POST /yamato_logistic_order_templates
  # POST /yamato_logistic_order_templates.json
  def create
    @yamato_logistic_order_template = YamatoLogisticOrderTemplate.new(yamato_logistic_order_template_params)

    if @yamato_logistic_order_template.save
      render :show, status: :created, location: @yamato_logistic_order_template
    else
      render json: @yamato_logistic_order_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /yamato_logistic_order_templates/1
  # PATCH/PUT /yamato_logistic_order_templates/1.json
  def update
    if @yamato_logistic_order_template.update(yamato_logistic_order_template_params)
      render :show, status: :ok, location: @yamato_logistic_order_template
    else
      render json: @yamato_logistic_order_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /yamato_logistic_order_templates/1
  # DELETE /yamato_logistic_order_templates/1.json
  def destroy
    @yamato_logistic_order_template.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamato_logistic_order_template
      @yamato_logistic_order_template = YamatoLogisticOrderTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamato_logistic_order_template_params
      params.require(:yamato_logistic_order_template).permit(:yamato_size_item_code_id, :yamato_packing_item_code_id, :yamato_handling_type_code_id, :—no-timestamps)
    end
end
