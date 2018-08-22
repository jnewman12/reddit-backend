class PostsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :cors_check

  def index
    posts = Post.all 
    render json: posts 
  end

  def create
    post = Post.new(title: params[:title], body: params[:body], link: params[:link])

    if post.save
      render json: post, status: 201, location: [post]
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments.order(create_at: :asc)
    response = { post: post, comments: comments }
    render json: response.to_json
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    head 204
  end

  def upvote
    post = Post.find(params[:id])

    if post.update(upvotes: post.upvotes += 1)
      render json: post, status: 201, location: [post]
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

end