class CommentsController < ApplicationController
  def index
      @comments = Comment.all
  end

  def create
    comment = Comment.new(comment: params[:comment], product: Product.find(params[:product_id]))
    if !comment.valid?
    flash[:errors] = comment.errors.full_messages
    redirect_to "/products/#{params[:product_id]}"
    else
    comment.save
    redirect_to "/products/#{params[:product_id]}"
    end
  end

end
