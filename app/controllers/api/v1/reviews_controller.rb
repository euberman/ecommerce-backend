class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews, except: [:created_at, :updated_at], include: [:product, :user]
  end

  def show
      @review = Review.find_by(id: params[:id])
      if @review
          render json: @review, except: [:created_at, :updated_at], include: [:product, :user]
      else
          render json: { message: 'Item not found' }
      end
  end

  def create
      @review = Review.new(review_params)
      @review.save
      render json: @review, except: [:created_at, :updated_at]
  end

  def update
    @review = Review.find_by(params[:id])
    @review.update_attributes(review_params)
      render json: @review, except: [:created_at, :updated_at]
  end

  def destroy
      Review.destroy(params[:id])
  end

  private

  def review_params
      params.require(:review).permit(:id, :user_id, :product_id, :rating)
  end
end
