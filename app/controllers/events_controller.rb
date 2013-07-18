class EventsController < ApplicationController

  def index
    @q = Event.search(params[:q])
    @events = @q.result(distinct: true)
    if @q.result.empty?
      flash[:error] = "No matches"
    end
  end

  def my_events
    @q = Event.where(creator_id: current_user.id).search(params[:q])
    @events = @q.result(distinct: true)
    if @q.result.empty?
      flash[:error] = "No matches"
    end
  end

  def bookings
    @event = Event.find(params[:id])
    @events = Event.scoped
  end

  def search
    index
    render :index
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  # USER ENROLS ON EVENT
  def enrol
    @event = Event.find(params[:id])
    @enrolment = Enrolment.create(event_id: @event.id, user_id: current_user.id, enrolment_date: DateTime.now.to_date, enrolment_status: 'Active', payment_status: 'pending')
    redirect_to event_path
  end

  # USER UNROLS FROM EVENT
  def destroy_enrol
    @event = Event.find(params[:id])
    @enrolment = Enrolment.destroy(event_id: @event.id, user_id: current_user.id, enrolment_date: DateTime.now.to_date, enrolment_status: 'Active', payment_status: 'pending')
    redirect_to account_path
  end

  # CREATE NEW BOOKING FOR EVENT
  def clone
    @event = Event.find(params[:id])
    @event = @event.dup
    @event.save
    render 'new'
  end

  def new
    @event = Event.new
  end

  # CREATE NEW EVENT
  def create
    @event = Event.new(params[:event])
    # DEFINING EVENT CREATOR
    @event.creator=current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
     @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { head :no_content }
    end
  end


  def enrolment_method
    @enrolment = Enrolment.new([:user])
    if @enrolment.save
      redirect_to root_path
    else
      render 'new'
    end
  end


end