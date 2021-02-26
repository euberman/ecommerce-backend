class Api::V1::OrderItemsController < ApplicationController
  def index
      @order_items = OrderItem.all
      render json: @order_items, except: [:created_at, :updated_at], include: [:product]
  end

  def show
      @order_item = OrderItem.find_by(id: params[:id])
      if @order_item
          render json: @order_item, except: [:created_at, :updated_at], include: [:product]
      else
          render json: { message: 'Item not found' }
      end
  end

  def create
      @order_item = OrderItem.new(order_item_params)
      @order_item.save
      render json: @order_item, except: [:created_at, :updated_at]
  end

  def update
      @order_item = OrderItem.find_by(params[:id])
      @order_item.update_attributes(order_item_params)
      render json: @order_item, except: [:created_at, :updated_at], include: [:product]
  end

  def destroy
      OrderItem.destroy(params[:id])
  end

  private

  def order_item_params
      params.require(:order_item).permit(:id, :order_id, :product_id, :title, :qty, :price, :subtotal)
  end
end
