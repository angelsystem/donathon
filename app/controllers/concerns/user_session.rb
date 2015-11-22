module UserSession
  private

  def try_log_in(user, success_path:, fail_path: success_path)
    log_in user
    return redirect_back_or(success_path)
  end
end
