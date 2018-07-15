class BonusController < ApplicationController
  before_action :set_bonu, only: [:show, :update, :destroy]

  # GET /bonus
  def index
    @bonus = Bonu.all

    render json: @bonus
  end

  # GET /bonus/1
  def show
    render json: @bonu
  end

  # POST /bonus
  def create
    @bonu = Bonu.new(bonu_params)

    if @bonu.save
      render json: @bonu, status: :created, location: @bonu
    else
      render json: @bonu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bonus/1
  def update
    if @bonu.update(bonu_params)
      render json: @bonu
    else
      render json: @bonu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bonus/1
  def destroy
    @bonu.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonu
      @bonu = Bonu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bonu_params
      params.require(:bonu).permit(:init_increase_bonus, :cost_money_unit, :increase_bonus, :max_increase_bonus, :cost_bonus_unit, :reduce_money, :limit_money, :max_reduce_bonus, :is_cost)
    end
end
