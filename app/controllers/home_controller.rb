class HomeController < ApplicationController
  def index
    @repertories = Repertory.where(user: current_user).all
  end
end
