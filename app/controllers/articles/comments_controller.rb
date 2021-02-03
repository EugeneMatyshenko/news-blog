module Articles
  class CommentsController < ApplicationController
    def index
      # binding.pry
      @comment = Comment.all
      @article_id = params[:article_id]
    end

    def new
      @comment = Comment.new
      @article = Article.find(params[:article_id])
    end

    def create
      # binding.pry
      article_id = Article.find(params[:article_id]).id
      user = current_user.id
      comment_id = Comment.find_by_user_id(user).id
      comment = CommentCreator.new(user, comment_params, article_id).call
      redirect_to article_comment_path(article_id, comment_id)
    end

    def show
      # binding.pry
      @comment = Comment.new
      user_id = Comment.find(params[:id]).user_id
      @comments = Comment.where(user_id: user_id, entity_type: "Article")
      @article = Article.find(params[:article_id])
    end

    def update
      @comment = Comment.find(params[:id])

      if @comment.update(comment_params)
        redirect_to article_comment_path
      else
        render 'edit'
      end
    end

    def edit
      @comment = Comment.find(params[:id])
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