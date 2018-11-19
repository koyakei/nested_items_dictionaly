class Admin::ItemAliasesController < ApplicationController
  before_action :set_item_alias, only: [:show, :update, :destroy]

  # GET /item_aliases
  # GET /item_aliases.json
  def index
    @item_aliases = ItemAliase.all
  end

  # GET /item_aliases/1
  # GET /item_aliases/1.json
  def show
  end

  # POST /item_aliases
  # POST /item_aliases.json
  def create
    @item_alias = ItemAliase.new(item_alias_params)

    if @item_alias.save
      render :show, status: :created, location: @item_alias
    else
      render json: @item_alias.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_aliases/1
  # PATCH/PUT /item_aliases/1.json
  def update
    if @item_alias.update(item_alias_params)
      render :show, status: :ok, location: @item_alias
    else
      render json: @item_alias.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_aliases/1
  # DELETE /item_aliases/1.json
  def destroy
    @item_alias.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_alias
      @item_alias = ItemAliase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_alias_params
      params.require(:item_alias).permit(:item_id, :name, :user_id)
    end
end
