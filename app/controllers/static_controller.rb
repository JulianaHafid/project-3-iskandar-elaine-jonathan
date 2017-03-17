class StaticController < ApplicationController

  before_action :authenticate_user!, only: [:landing]

  def homepage
  end

  def landing
    @events = Event.all
    @events.order(date: :asc)
    @request = Request.all
    @request.order(created_at: :asc)
  end

end
