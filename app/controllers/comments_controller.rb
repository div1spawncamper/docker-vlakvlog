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

    if @comment.save
      redirect_to article_path(@article)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    puts "Current ability: #{current_ability.inspect}"
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def delete_image
    @comment = Comment.find(params[:id])
    @image = @comment.images.find(params[:image_id])
    authorize! :delete_image, @comment
    @image.purge
    redirect_to @comment.article, notice: 'Image was successfully deleted.'
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, images: [])
    end
end
