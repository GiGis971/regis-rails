class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    puts @article.inspect
    comment = @article.comments.find(params[:id])
    comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :status)
  end
end
