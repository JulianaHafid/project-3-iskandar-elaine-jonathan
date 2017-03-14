class StaticController < ApplicationController
  
  before_filter :authenticate_user!, only: [:landing]

  def homepage
  end

  def landing
  end
end
