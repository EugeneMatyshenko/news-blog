class CommentCommentCreator
  def initialize(current_user, comment_params, comment_id)
    @current_user = current_user
    @comment_params = comment_params
    @comment_id = comment_id
  end

  def call
    user = current_user
    comment = comment_params
    id = comment_id

    save_comment(user, comment, comment_id)
  end

  private

  attr_reader :current_user, :comment_params, :comment_id

  def save_comment(current_user, comment_params, comment_id)
    binding.pry
    comment_entity = Comment.find(comment_id)
    comment = Comment.create!(user_id: current_user, text: comment_params.fetch(:text), entity: comment_entity)
  end

end
