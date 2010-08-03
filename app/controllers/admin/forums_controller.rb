class Admin::ForumsController < ApplicationController
  before_filter :login_required
  before_filter :set_current
  before_filter :find_forum , :only =>[:show,:edit,:update,:destroy]
  def index
    @forums = Forum.all
  end

  def show
    @posts = @forum.posts
    @post = Post.new
    if params[:sort] == "old"
	@posts = @posts.paginate(:per_page => 2, :page => params[:page])
    else
	@posts = @posts.recent.paginate(:per_page => 2, :page => params[:page])
    end
  end
  def new
    @forum = Forum.new
  end

  def edit
  end

  def create
    @forum = Forum.new(params[:forum])

      if @forum.save
        flash[:notice] = 'Forum was successfully created.'
         redirect_to admin_forums_path
      else
         render :action => "new" 
      end
  end

  def update
      if @forum.update_attributes(params[:forum])
        flash[:notice] = 'Forum was successfully updated.'
        redirect_to admin_forums_path
      else
        render :action => "edit" 
      end
  end

  def destroy
      @forum.destroy
      redirect_to admin_forums_path
  end

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
  def set_current
    @current = admin_root_path
  end
end
