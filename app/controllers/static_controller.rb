class StaticController < ApplicationController

  before_action :authenticate_user!, only: [:landing]

  def homepage
  end

  def landing
    @events = Event.all.order(date: :asc)
    @request = Request.all.order(created_at: :asc)
  end

end
