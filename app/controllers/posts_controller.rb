class PostsController < ApplicationController

  def index
    posts = Post.all 
    render json: posts 
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: 201, location: [post]
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments
    render json: { post.to_json(include: [comments]) }
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

  private

  def post_params
    params.permit(:title, :link, :body)
  end

end