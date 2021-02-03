class ArticlesController < ApplicationController
  def index
    # binding.pry
    @article = Article.all
    @article_id = params[:article_id]
    @comment = Comment

  end

  def new
    @article = ArticleWithUserEmail.new
  end

  def create
    # binding.pry
    article = ArticleCreator.new(article_params).call
    redirect_to article_path(article)
  end

  def show
    # binding.pry
    @article = Article.find(params[:id])
    user_id = @article.user_id
    path = "users.id = ".concat(user_id.to_s)
    @user_email = Article.joins(:user).where(path).select("email").first.email
    @tags = Tag.where(user_id: user_id)
    # @test = Article.joins(:user).where("users.id = 5").select("email").first.email
  end

  def update
    @article = UpdateArticleCreator.new(article_params).call
    redirect_to articles_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_comments_path
  end

  private

  def article_params
    # binding.pry
    params.require(:article_with_user_email).permit(:user_id, :user_email, :title, :body)
  end

  def art_update

  end

end
