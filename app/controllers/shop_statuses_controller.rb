class ShopStatusesController < ApplicationController
  before_action :set_shop_status, only: [:show, :update, :destroy]

  # GET /shop_statuses
  def index
    @shop_statuses = ShopStatus.all

    render json: @shop_statuses
  end

  # GET /shop_statuses/1
  def show
    render json: @shop_status
  end

  # POST /shop_statuses
  def create
    @shop_status = ShopStatus.new(shop_status_params)

    if @shop_status.save
      render json: @shop_status, status: :created, location: @shop_status
    else
      render json: @shop_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shop_statuses/1
  def update
    if @shop_status.update(shop_status_params)
      render json: @shop_status
    else
      render json: @shop_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shop_statuses/1
  def destroy
    @shop_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_status
      @shop_status = ShopStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_status_params
      params.require(:shop_status).permit(:status, :begin_time, :end_time, :open)
    end
end
