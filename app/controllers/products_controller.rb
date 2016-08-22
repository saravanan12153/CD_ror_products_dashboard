class ProductsController < ApplicationController
  def index
      @products = Product.all
  end

  def show
      @product = Product.find(params[:id])
      @flash_messages = flash[:success]
  end

  def new
      @flash_messages = flash[:errors]
      @categories = Category.all
  end

  def create
    product = Product.new(name: params[:name], description: params[:description], pricing: params[:pricing], category: Category.find(params[:category]))
    if !product.valid?
    flash[:errors] = product.errors.full_messages
    redirect_to 'products/new' # products_new_path
    else
    product.save
    redirect_to '/' # root_path
  end
  end

  def edit
      @product = Product.find(params[:id])
      @categories = Category.all
  end
  def update
      @product = Product.find(params[:id]).update( name: params[:name], description: params[:description], pricing: params[:pricing], category: Category.find(params[:category]))
      redirect_to '/products/'+params[:id]
      flash[:success] = "Successfully updated!"
  end
  def delete
  Product.find(params[:id]).destroy
        redirect_to '/'
  end
end
