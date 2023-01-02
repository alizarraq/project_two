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
    if params[:commit] == "Approve"
      @comment.status = Comment::STATUS_APPROVED
    else
      @comment.status = Comment::STATUS_DECLINED
    end
    if @comment.save
      redirect_to @comment.order, notice: "Comment updated successfully"
    else
      render "edit"
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end