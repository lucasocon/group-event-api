class Api::V1::GroupEventsController < GroupEventsController
  before_action :set_group_event, only: %i[show edit update destroy published]

  def index
    render json: GroupEvent.with_deleted.map(&:serialize)
  end

  def show
    render json: @group_event.serialize, status: 201
  end

  def new; end

  def create
    @group_event = GroupEvent.create!(group_event_params)
    render json: @group_event.serialize
  end

  def update
    @group_event.update(group_event_params)
    render json: @group_event.serialize
  end

  def published
    @group_event.published_event
    render json: @group_event.serialize
  end

  def destroy
    @group_event.destroy
  end
end
