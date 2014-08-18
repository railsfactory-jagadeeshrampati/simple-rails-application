class PostsController < ApplicationController
before_filter :check_privileges!, only: [:show, :new, :create, :edit, :save, :destroy]
before_action :authenticate_user!
 def index
     @posts= Post.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
    #@posts1= Post.joins(:user).where
     @posts1=Post.where.not(visible: 0,user_id: current_user.id)
  
end
 
  def show
     @post = Post.find(params[:id])
  end
  
  def  new
     @post = Post.new
  end

  def  create
     @post = Post.new(params[:post].permit(:title,:content,:visible)) 
    @post.user = current_user    
  
     if @post.save
        redirect_to posts_path, :notice => "Your post was saved"
     else
         render "new"
     end
  end

  def  edit
      @post = Post.find(params[:id])
  end

  def  update
      @post = Post.find(params[:id])
      
       if @post.update_attributes(params[:post].permit(:title,:content))
        redirect_to posts_path, :notice => "your post has been updated"
       else
        render "edit"
       end
  end

  def  destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, :notice => "post has been deleted"
  end

end
