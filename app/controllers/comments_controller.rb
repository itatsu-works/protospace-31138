class CommentsController < ApplicationController

  def create
    if @comment = Comment.create(comment_params)
      redirect_to "/prototypes/#{params[:prototype_id]}"
    else
      render "/prototypes/#{params[:prototype_id]}"
    end
  end
  def show
    @comment = Comment.new
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
