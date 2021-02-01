class ArticleCreator
  def initialize(article_params)
    @article_params = article_params
    # @current_user
    # @params
  end

  def call
    article = article_params
    save_article(article)
  end

  private
  attr_reader :article_params

  def save_article(article_params)
    # binding.pry
    user_email = article_params.fetch(:user_email)
    user_id = User.find_by(email: user_email).id
    article = Article.create!(user_id: user_id, title: article_params.fetch(:title), body: article_params.fetch(:body))
  end

end


# Article.create!(title: article_params.fetch(:title), body: article_params.fetch(:body))
# Article.create!(title: "New title", body: "New body for new article")
# article = {title: "Title", body: "Body for new title", user_email: "test@gmail.com"}
#
# Article.create!(article.slice(:title, :body))
# Article.create!(title: article_params.fetch(:title), body: article_params.fetch(:body))