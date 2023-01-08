class CommentsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @comment = @order.comments.new(comment_params)
    @comment.worker = current_user
    if @comment.save
      redirect_to @order, notice: "Comment created successfully"
    else
      render "orders/show"
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    if params[:commit] == "Decline"
      @comment.status = "declined"
    else
      @comment.status = "approved"
    end
    if @comment.save
      if @comment.status == "approved"
        active_order = ActiveOrder.new(user_id: @comment.order.user_id, worker_id: @comment.worker_id, 
        order_id: @comment.order_id, title: @comment.order.title, descreption: @comment.order.descreption, location: @comment.order.location, category: @comment.order.categories, 
        c_price: @comment.price, date: @comment.date)
        active_order.save
        @comment.order.destroy
        redirect_to active_orders_path, notice: 'Comment was successfully approved.' 
      elsif @comment.status == "declined"
        redirect_to @comment.order, notice: 'Comment was successfully declined.'
        @comment.destroy
      end
    else
      render "edit"
    end
  end
  
  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(comment_params)
  #     if @comment.status == "approved"
  #       # Create a new active order
  #       active_order = ActiveOrder.create(user_id: @comment.order.user_id, worker_id: @comment.worker_id, order: @comment.order)
  #     redirect_to @comment, notice: 'Comment was successfully updated.'
  #     elsif @comment.status == "declined"
  #       @comment.destroy
  #       redirect_to @comment, notice: 'Comment was successfully updated.'
  #     end
  #   else
  #     render :edit
  #   end
  # end
  private
    def comment_params
      params.require(:comment).permit(:content, :price, :date)
    end
end