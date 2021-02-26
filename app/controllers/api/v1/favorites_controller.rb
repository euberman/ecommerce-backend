class Api::V1::FavoritesController < ApplicationController
  def index
      @favorites = Favorite.all
      render json: @favorites, except: [:created_at, :updated_at]
  end

  def show
      @favorite = Favorite.find_by(id: params[:id])
      if @favorite
          render json: @favorite, except: [:created_at, :updated_at]
      else
          render json: { message: 'favorite not found' }
      end
  end

  def create
      @favorite = Favorite.new(favorite_params)
      @favorite.save
      render json: @favorite, except: [:created_at, :updated_at]
  end

  def update
      @favorite = Favorite.find_by(params[:id])
      @favorite.update_attributes(favorite_params)
      render json: @favorite, except: [:created_at, :updated_at]
  end

  def destroy
      Favorite.destroy(params[:id])
  end

  private

  def favorite_params
      params.require(:favorite).permit(:user_id, :product_id)
  end
end
