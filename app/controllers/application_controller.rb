class ApplicationController < ActionController::Base
  # THIS LINE IS COMMENTED OUT SO THAT POSTMAN CAN SEND AUTHENTICATE WITH DEVISE
  # protect_from_forgery with: :exception

  before_action :authenticate_user!
end
