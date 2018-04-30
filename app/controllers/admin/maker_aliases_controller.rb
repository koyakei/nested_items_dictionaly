class Admin::MakerAliasesController < ApplicationController
  before_action :set_maker_alias, only: [:show, :update, :destroy]

  # GET /maker_aliases
  # GET /maker_aliases.json
  def index
    @maker_aliases = MakerAlias.all
  end

  # GET /maker_aliases/1
  # GET /maker_aliases/1.json
  def show
  end

  # POST /maker_aliases
  # POST /maker_aliases.json
  def create
    @maker_alias = MakerAlias.new(maker_alias_params)

    if @maker_alias.save
      render :show, status: :created, location: @maker_alias
    else
      render json: @maker_alias.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /maker_aliases/1
  # PATCH/PUT /maker_aliases/1.json
  def update
    if @maker_alias.update(maker_alias_params)
      render :show, status: :ok, location: @maker_alias
    else
      render json: @maker_alias.errors, status: :unprocessable_entity
    end
  end

  # DELETE /maker_aliases/1
  # DELETE /maker_aliases/1.json
  def destroy
    @maker_alias.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maker_alias
      @maker_alias = MakerAlias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maker_alias_params
      params.require(:maker_alias).permit(:maker_id, :name)
    end
end
