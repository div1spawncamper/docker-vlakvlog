class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    puts "Current ability: #{current_ability.inspect}"
    redirect_to @article
  end




  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user: current_user))
    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    puts "Current ability: #{current_ability.inspect}"
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end