class UpdateArticleCreator
  def initialize(article_params)
    @article_params = article_params
  end

  def call
    article = article_params
    update_article(article)
  end

  private

  attr_reader :article_params

  def update_article(article_params)
    article = Article.update!(user_id: article_params.fetch(:user_id), user_email: article_params.fetch(:user_email), title: article_params.fetch(:title), body: article_params.fetch(:body))
  end
end
