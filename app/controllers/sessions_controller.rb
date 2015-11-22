class SessionsController < ApplicationController
  include UserSession

  before_action :log_out, if: :current_admin, only: [:create, :destroy_session]

  def new
  end

  def create
    admin = Admin.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if admin && admin.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:admin_id] = admin.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy_session
    redirect_to root_url, notice: 'You have been signed out.'
  end
end
