class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector

  before_action :set_view_path


  private

  def set_view_path
    path =  request.smart_phone? ? 'smartphone' : ''
    prepend_view_path(Rails.root + 'app/views' + path)
    puts path
    puts "------------------------------------------------"
  end
end
