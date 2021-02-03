module Comments
  class CommentsController < ApplicationController
    def index
      @comment = Comment.all
    end

    def new
      # binding.pry
      @comment = Comment.new
      @comment_to_find = Comment.find(params[:comment_id])
    end

    def create
      article_id = Comment.find(params[:comment_id]).id
      user = current_user.id
      comment_id = Comment.find_by_user_id(user).id
      comment = CommentCommentCreator.new(user, comment_params, comment_id).call
      redirect_to comment_comment_path(article_id, comment_id)
    end

    def show
      # binding.pry
      @article = Article.find(params[:id])
      @comment = Comment.new
      user_id = Comment.find(params[:id]).user_id
      @comments = Comment.where(entity_type: "Comment", user_id: user_id)
    end

    def update
      # @comment = Comment.find(params[:id])
      #
      # if @comment.update(comment_params)
      #   redirect_to article_comment_path
      # else
      #   render 'edit'
      # end
    end

    def edit
      # @comment = Comment.find(params[:id])
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to articles_path
    end

    private

    def comment_params
      params.require(:comment).permit(:user, :text)
    end
  end
end
