class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :admin? , only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
      @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # @upload = Cloudinary::Uploader.upload(params[:image_url])
    # @picture = @upload["secure_url"]
    @event.user_id = current_user.id
    # @event.image_url = @picture

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @requests = Request.where event_id: params[:id]
    p params[:id]
    respond_to do |format|
  format.html
  format.json { render json: @event }
end
  end

  def edit
  end

  def update
    respond_to do |format|
    if @event.update(event_params)
      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      format.json { render :show, status: :ok, location: @event }
    else
      format.html { render :edit }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def event_params
      params.require(:event).permit(:name, :location, :date, :time, :image_url)
    end

  def set_event
    @event = Event.find(params[:id])
  end

  def admin?
    if !current_user.is_Admin
      redirect_to :events, :alert => "Hi there, it seems that you might be lost!"
    if !current_user
      redirect_to :new_user_registration, :notice => "Hi there, we invite you to sign up with us"
    end
  end
end
  end
