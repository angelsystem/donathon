module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    session.delete(:forwarding_path)
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  def logged_in?
    current_user.present?
  end


  def login_required
    session[:forwarding_path] = request.original_fullpath if request.get?
    msg = 'Por favor inicia sesión o registrate'
    redirect_to login_path, notice: msg unless logged_in?
  end

  def redirect_back_or(default, opts = {})
    redirect_to(session[:forwarding_path] || default, opts)
    session.delete(:forwarding_path)
  end

end
