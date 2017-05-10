class HomeController < ApplicationController
  def index
    @user_agent = request.env['HTTP_USER_AGENT']
    @user_ip = request.remote_ip
  end
end
