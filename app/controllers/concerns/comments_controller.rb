class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :cors_check

  def index
    post = Post.find(params[:post_id])
    render json: post.comments 
  end

  def create
    comment = Comment.new(body: params[:body], post_id: params[:postId])

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
