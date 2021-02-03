class CommentCreator
  def initialize(current_user, comment_params, article_id)
    @current_user = current_user
    @comment_params = comment_params
    @article_id = article_id
  end

  def call
    user = current_user
    comment = comment_params
    id = article_id

    save_comment(user, comment, id)
  end

  private

  attr_reader :current_user, :comment_params, :article_id

  def save_comment(current_user, comment_params, id)
    # binding.pry
    # current_user
    # comment_params
    # user_email = article_params.fetch(:user_email)
    # user_id = User.find_by(email: user_email).id
    # article = Article.create!(user_id: user_id, title: article_params.fetch(:title), body: article_params.fetch(:body))

    article_entity = Article.find(id)
    # article_for_test = Comment.find(id)
    comment = Comment.create!(user_id: current_user, text: comment_params.fetch(:text), entity: article_entity)
  end

end
