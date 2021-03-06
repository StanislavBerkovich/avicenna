class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :html
  protect_from_forgery with: :exception
  TABLES_PER_PAGE = 20
end
