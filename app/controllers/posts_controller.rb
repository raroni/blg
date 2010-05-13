class PostsController < ApplicationController
  before_filter :authenticate!, :only => [:new, :create, :manage]
  
  def index
    @posts = Post.published.order('id desc')
  end
  
  def new
    @post = Post.new
  end
  
  def manage
    @posts = Post.scoped
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    if @post.save
      redirect_to users_path, :notice => 'Post created.'
    else
      render :action => 'new'
    end
  end
  
  def show
    @post = Post.find_by_permalink params[:permalink]
    redirect_to root_path, :error => 'Page not found.' unless @post
  end
end
