class UsersController < ApplicationController
  def signup
  end

  def signup_done
    id = params[:user_id]
    pass = params[:user_password]
    u = User.new
    u.username = id

    if pass == params[:retype_password]
        u.password = pass
        if u.save
            flash[:alert] = "Sign up complete."
            redirect_to "/"
        else
            flash[:alert] = u.errors.ivalues.flatten.join(' ') # 
            redirect_to :back
        end
    else
        flash[:alert] = "Please retype password correctly."
        redirect_to :back
    end
  end

  def login
  end

  def login_done
    username = params[:user_username]
    pass = params[:user_password]

    u = User.where(username: username)[0]

    if u.nil?
        flash[:alert] = "Check your Username."
        redirect_to :back
    elsif u.password == pass
        flash[:alert] = "Login Successful!"
        session[:user_id] = u.id
        redirect_to "/"
    else
        flash[:alert] = "Check your Password."
        redirect_to :back
    end
  end

  def logout
    #session.delete(:user_id)
    reset_session #this is how you delete a session!!
    flash[:alert] = "Logout complete"
    redirect_to :back
  end
end
