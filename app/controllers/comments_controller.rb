class CommentsController < ApplicationController

  def create
    micropost = Micropost.find(params[:micropost_id])
    @comment = micropost.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to root_path
    else
      flash[:danger] = "コメントできませんでした"
      redirect_to root_path
    end
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    @comment = micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private
    def content_params
      params.require(:comment).permit(:content).merge(micropost_id: params[:id])
    end

end