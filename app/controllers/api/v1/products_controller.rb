class Api::V1::ProductsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @products = Product.all
        #render json: { product: ProductSerializer.new(@products)}
        render json: @products, except: [:created_at, :updated_at]
    end

    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render json: @product, except: [:created_at, :updated_at]
            # render json: @product, except: [:created_at, :updated_at], include: [:reviews]
        else
            render json: { message: 'Product not found' }
        end
        
    end

    def create
        @product = Product.new(product_params)
        @product.save
        render json: @product, except: [:created_at, :updated_at]
    end

    def update
        @product = Product.find(params[:id])
        @product.update_attributes(product_params)
        render json: @product, except: [:created_at, :updated_at]
    end

    private

    def product_params
        params.require(:product).permit(:id, :brand, :product_id, :department, :title, :description, :image_url, :in_stock, :stock, :price)
    end
end
# :rating, :num_reviews, 