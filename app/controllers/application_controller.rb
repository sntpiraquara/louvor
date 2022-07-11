class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_layout

  private

  def set_layout
    self.class.layout devise_controller? ? 'public' : 'application'
  end
end
