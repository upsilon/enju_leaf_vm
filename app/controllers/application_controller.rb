class ApplicationController < ActionController::Base
  include EnjuCirculation::Controller
  include EnjuLibrary::Controller
  include EnjuSubject::Controller
  include EnjuBiblio::Controller

  include Pundit
  before_action :set_paper_trail_whodunnit
  after_action :verify_authorized, unless: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
