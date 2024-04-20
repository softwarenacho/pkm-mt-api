require 'mongo'

class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show update destroy ]

  # GET /players
  def index
    @players = Player.all

    render json: @players, except: [:password]
    # render json: @players, include: :boards, except: [:password]
  end

  # GET /players/1
  def show
    render json: @player, include: :boards, except: [:password, :created_at, :updated_at]
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player, except: [:password, :created_at, :updated_at]
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def avatar
    pp 'avatar'
  end

  def destroy
    @player.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :color, :avatar, :email, :password)
    end
end
