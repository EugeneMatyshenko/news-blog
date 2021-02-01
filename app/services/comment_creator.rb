class CommentCreator
  def initialize(current_user, comment_params)
    @current_user = current_user
    @comment_params = comment_params
  end

  def call
    user = current_user
    comment = comment_params

    save_comment(user, comment)
  end

  private

  attr_reader :current_user, :comment_params

  def save_comment(current_user, comment_params)
    # binding.pry
    # current_user
    # comment_params
    # user_email = article_params.fetch(:user_email)
    # user_id = User.find_by(email: user_email).id
    # article = Article.create!(user_id: user_id, title: article_params.fetch(:title), body: article_params.fetch(:body))

    article_for_test = Article.find(19)
    comment = Comment.create!(user_id: current_user, text: comment_params.fetch(:text), entity: article_for_test)
  end

end
