class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to episode_path(@comment.episode_id)
    else
      @comment_items = []
      redirect_to episode_path(@comment.episode_id)
    end
  end

  def destroy
    @comment.destroy  
  end


  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :episode_id)
    end
end