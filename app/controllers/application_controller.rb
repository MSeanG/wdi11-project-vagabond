class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  protect_from_forgery with: :exception
  # def home
  #   render html: "Welcome to Vagabond!"
  # end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access Denied!"
    flash.keep(:notice)
    redirect_to root_url
  end

  private
  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end
