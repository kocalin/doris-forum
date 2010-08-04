class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post, :only => [:edit,:destroy,:update]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
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
   if logged_in?
   @post = @forum.posts.build(params[:post])
   @post.user_id = current_user
   @post.save
   else
    flash[:notice] = 'You must be logged in.'
   end
   redirect_to @forum
  end

  def update
    if  @post.user_id == current_user.id
        if @post.mugshot and params[:post][:mugshot_attributes]
	    @post.mugshot.destroy
	    @post.reload
	end
	if @post.update_attributes(params[:post])
           flash[:notice] = 'Post was successfully updated.'
           redirect_to forum_path(@post.forum_id)
        else
           render :action => "edit"
        end
    else
	flash[:notice] = 'it`s not your post.'
	redirect_to forum_path(@post.forum_id)
    end
  end

  def destroy
    if  @post.user_id == current_user.id
	@post.destroy
    else
        flash[:notice] = 'it`s not your post.'
    end
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
	@post = @forum.posts.find(params[:id])
    end
end
