class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to post_path
    else
      render 'new'
    end

    def edit
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(comment_params)
    end

    def update
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(comment_params)
      if @comment.update(comment_params)
        redirect_to post_path
      else
        render 'edit'
      end

      def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(comment_params)
        @comment.destroy
        redirect_to post_path

      end


  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
