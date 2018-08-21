class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    render json: post.comments 
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment, status: 201, location: [comment]
    else
      render json: { errors: comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])

    post.comments.delete(comment)

    head 204
  end

  def upvote
    comment = Comment.find(params[:id])

    if comment.update(upvotes: comment.upvotes += 1)
      render json: comment, status: 201, location: [comment]
    else
      render json: { errors: comment.errors }, status: :unprocessable_entity
    end
  end

  def comment_params
    params.permit(:post_id, :body)
  end

end
