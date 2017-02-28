class ApplicationController < ActionController::Base
  # THIS LINE IS COMMENTED OUT SO THAT POSTMAN CAN SEND AUTHENTICATE WITH DEVISE
  # protect_from_forgery with: :exception


  # THOSE TWO LINES WERE ADVISED BY THIS GUY https://labs.chiedo.com/blog/authenticating-your-reactjs-app-with-devise-no-extra-gems-needed/
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?


  before_action :authenticate_user!
end
