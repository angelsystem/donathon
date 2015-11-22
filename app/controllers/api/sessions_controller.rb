module Api
  class SessionsController < ApplicationController
    def create
      fb_access_token = params[:access_token]
      user = User.authenticate_user_from_facebook(fb_access_token)
      session[:user_id] = user.id
      render :json => user.to_json, :status => 200
    end

    def failure
      render json: params
    end

    def destroy
      session[:user_id] = nil
      session[:omniauth] = nil
      redirect_to api_root_path, notice: 'Signed Out'
    end
  end
end
