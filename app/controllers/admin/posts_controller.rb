class Admin::PostsController < ApplicationController
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
   @post = @forum.posts.build(params[:post])
   @post.user_id = current_user
   @post.save

    respond_to do |format|
	format.html{redirect_to admin_forum_instance_path(@forum)}
	format.js
    end
  end

  def update
        if @post.mugshot and params[:post][:mugshot_attributes]
	    @post.mugshot.destroy
	    @post.reload
	end
	if @post.update_attributes(params[:post])
           flash[:notice] = 'Post was successfully updated.'
           redirect_to admin_forum_instance_path(@post.forum_id)
        else
           render :action => "edit"
        end
  end

  def destroy
	#admin可以刪所有文章
	@post.destroy
    	respond_to do |format|
    	  format.html { redirect_to admin_forum_instance_path(@forum) }
    	  format.xml  { head :ok }
    	end
  end
 protected
    def find_forum
	@forum = Forum.find(params[:forum_instance_id])
	@current = admin_root_path
    end
    def find_post
	@post = @forum.posts.find(params[:id])
    end
end
