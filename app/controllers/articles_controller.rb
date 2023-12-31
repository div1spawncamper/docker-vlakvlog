class ArticlesController < ApplicationController
  #skip_authorization_check only: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.with_attached_images.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params.merge(images: params[:article][:images]))

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  def delete_image
    @article = Article.find(params[:id])
    @image = @article.images.find(params[:image_id])
    authorize! :delete_image, @article
    @image.purge
    redirect_to @article, notice: 'Image was successfully deleted.'
  end



  before_action :authenticate_user!, except: [:index, :show]

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, images: [])
  end
end
