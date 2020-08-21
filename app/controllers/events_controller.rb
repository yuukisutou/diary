class EventsController < ApplicationController
  before_action :login_required
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.events.ransack(params[:q])
    @events = @q.result(distinct: true). recent
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def update
    @event.update!(event_params)
    redirect_to events_url, notice: "記事「#{@event.name}」を更新しました。"
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "記事「#{@event.name}」を削除しました"
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: "記事「#{@event.name}」を登録しました"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end
