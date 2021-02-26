class Api::V1::OrdersController < ApplicationController

    def index
        @orders = Order.all
        render json: @orders, except: [:created_at, :updated_at], include:[:order_items, :user]
    end

    def show
        @order = Order.find_by(id: params[:id])
        if @order
            render json: @order, except: [:created_at, :updated_at], include:[:order_items, :user]
        else
            render json: { message: 'Order not found' }
        end
    end

    def create
        @order = Order.new(order_params)
        @order.save
        render json: @order, except: [:created_at, :updated_at], include:[:order_items, :user]
    end

    def update
        @order = Order.find(params[:id])
        @order.update_attributes(order_params)
        render json: @order
    end
    # def update
    #     @order = Order.find(params[:id])
    #     # @order.update_attributes(order_params)
    #     @order.update(order_params)
    #     @order.save()
    #     if @order
    #         render json: @order, except: [:created_at, :updated_at], include:[:order_items, :user]
    #     else
    #         render json: { message: 'Order not found/updated' }
    #     end
    # end

    private

    def order_params
        params.require(:order).permit(:user_id, :name, :order_date, :total, :item_count, :isShipped, :shipped_date, :paid, :payment, :address_street, :address_city, :address_state, :address_zip)
    end
end
