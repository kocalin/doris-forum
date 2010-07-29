class PostsController < ApplicationController
  before_filter :find_forum , :only => [:create,:destroy]
  before_filter :find_post, :only => [:show,:edit,:create,:destroy,:update]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
  end

  def create
   @post = @forum.posts.create(params[:post])

    respond_to do |format|
	format.html{redirect_to @forum}
	format.js
    end
  end

  def update

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to forum_path(@post.forum_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to forum_path(@forum) }
      format.xml  { head :ok }
    end
  end
 protected
    def find_forum
	@forum = Forum.find(params[:forum_id])
    end
    def find_post
	@post = Post.find(params[:id])
    end
end
