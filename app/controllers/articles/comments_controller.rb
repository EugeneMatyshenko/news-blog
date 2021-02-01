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
      # @article = Article.find(params[:article_id])
      # @comment = Comment.new(comment_params)
      # if @comment.save
      #   redirect_to article_comments_path
      # else
      #   render 'new'
      # end
      # binding.pry
      article_id = Article.find(params[:article_id]).id
      user = current_user.id
      comment_id = Comment.find_by_user_id(user).id
      comment = CommentCreator.new(user, comment_params).call
      redirect_to article_comment_path(article_id, comment_id)
    end

    def show
      @comment = Comment.find(params[:id])
      @comments = Comment.all
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