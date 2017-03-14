class StaticController < ApplicationController

  before_action :authenticate_user!, only: [:landing]

  def homepage
  end

  def landing
    @events = Event.all
    @request = Request.all
  end

end
