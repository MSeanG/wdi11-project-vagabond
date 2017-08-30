class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  protect_from_forgery with: :exception
  # def home
  #   render html: "Welcome to Vagabond!"
  # end
end
