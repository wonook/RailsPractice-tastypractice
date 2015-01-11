class PostsController < ApplicationController
    before_action :login_check
    skip_before_action :login_check, only: [:show_all, :show_by_category, :show]

  def show_all
    @posts = Post.all
  end

  def show_by_category
    @category = params[:category]
    @posts = Post.where(category: @category)
  end

  def show
    @post = Post.find(params[:id])
  end

  def write
  end

  def write_done
    category = params[:post_category]
    title = params[:post_title]
    content = params[:post_content]

    p = Post.new
    p.title = title
    p.category = category
    p.content = content
    p.user_id = session[:user_id] 

    if p.save
        flash[:alert] = "Saved."
        redirect_to "/posts/show/#{p.id}"
    else
        flash[:alert] = p.errors.values.flatten.join(' ')
        redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def edit_done
    title = params[:post_title]
    content = params[:post_content]
    category = params[:post_category]

    p = Post.find(params[:id])
    p.title = title
    p.content = content
    p.category = category
    if p.save
        flash[:alert] = "Edited"
        redirect_to "/posts/show/#{params[:id]}"
    else
        flash[:alert] = p.errors.values.flatten.join(' ')
        redirect_to :back
    end
  end

  def delete_done
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "Deleted"
    redirect_to "/"
  end

  def write_comment_done
    postid = params[:post_id]
    content = params[:comment_content]
    u = User.find(session[:user_id])

    c = Comment.new
    c.post_id = postid
    c.content = content
    c.user_id = u.id
    c.save

    flash[:alert] = "Comment submitted."
    redirect_to "/posts/show/#{c.post_id}"
  end

  def edit_comment
    @comment = Comment.find(params[:id])
  end

  def edit_comment_done
      c = Comment.find(params[:id])
      c.content = params[:comment_content]
      c.save

      flash[:alert] = "comment edited."
      redirect_to "/posts/show/#{c.post_id}"
      
  end

  def delete_comment
  end

  def delete_comment_done
    c = Comment.find(params[:id])
    postid = c.post_id
    c.destroy
    flash[:alert] = "Comment Deleted."
    redirect_to "/posts/show/#{postid}"
  end
end
