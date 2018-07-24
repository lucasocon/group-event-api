class GroupEventsController < ApplicationController
  before_action :set_group_event, only: %i[show edit update destroy published]

  def index
    @group_events = GroupEvent.with_deleted
  end

  def show; end

  def new
    @group_event = GroupEvent.new
  end

  def edit; end

  def create
    @group_event = GroupEvent.new(group_event_params)

    respond_to do |format|
      if @group_event.save
        format.html { redirect_to @group_event, notice: 'Group event was successfully created.' }
        format.json { render :show, status: :created, location: @group_event }
      else
        format.html { render :new }
        format.json { render json: @group_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group_event.update(group_event_params)
        format.html { redirect_to @group_event, notice: 'Group event was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_event }
      else
        format.html { render :edit }
        format.json { render json: @group_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def published
    if @group_event.published_event
      flash[:success] = 'Group Event published!'
    else
      flash[:error] = 'All fields should be full!'
    end
    redirect_to @group_event
  end

  def destroy
    @group_event.destroy
    respond_to do |format|
      format.html { redirect_to group_events_url, notice: 'Group event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group_event
    @group_event = GroupEvent.with_deleted.find(params[:id] || params[:group_event_id])
  end

  def group_event_params
    params.require(:group_event).permit(:name, :description, :duration, :location, :end_date, :start_date, :number_days)
  end
end
