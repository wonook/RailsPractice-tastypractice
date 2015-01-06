class PostsController < ApplicationController
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
    if p.save
        flash[:alert] = "Saved."
        redirect_to "/posts/show/#{p.id}"
    else
        flash[:alert] = p.errors.values.flatten.join(' ')
        redirect_to :back
    end
  end

  def edit
    @post = Post.find(:id)
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
    post = Post.find(:id)
    post.destroy
    flash[:alert] = "Deleted"
    redirect_to "/"
  end
end
