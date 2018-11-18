class Admin::MakerAliasesController < ApplicationController
  before_action :set_admin_maker_alias, only: [:show, :update, :destroy]

  # GET /admin/maker_aliases
  # GET /admin/maker_aliases.json
  def index
    @admin_maker_aliases = Admin::MakerAlias.all
  end

  # GET /admin/maker_aliases/1
  # GET /admin/maker_aliases/1.json
  def show
  end

  # POST /admin/maker_aliases
  # POST /admin/maker_aliases.json
  def create
    @admin_maker_alias = Admin::MakerAlias.new(admin_maker_alias_params)

    if @admin_maker_alias.save
      render :show, status: :created, location: @admin_maker_alias
    else
      render json: @admin_maker_alias.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/maker_aliases/1
  # PATCH/PUT /admin/maker_aliases/1.json
  def update
    if @admin_maker_alias.update(admin_maker_alias_params)
      render :show, status: :ok, location: @admin_maker_alias
    else
      render json: @admin_maker_alias.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/maker_aliases/1
  # DELETE /admin/maker_aliases/1.json
  def destroy
    @admin_maker_alias.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_maker_alias
      @admin_maker_alias = Admin::MakerAlias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_maker_alias_params
      params.require(:admin_maker_alias).permit(:maker_id, :name)
    end
end
