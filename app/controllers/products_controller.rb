class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Failed adding product"
      redirect_back fallback_location: root_path
    end
  end

  private

  def product_params
    params.require(:product).permit!(:name, :barcode, :kcal, :protein, :fat, :carbohydrates, :standard_portion_modifier)
  end
end
