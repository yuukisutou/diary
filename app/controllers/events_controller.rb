class EventsController < ApplicationController
  before_action :login_required
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.events.ransack(params[:q])
    @events = @q.result(distinct: true).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.csv { send_data @events.generate_csv, filename: "events-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
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
  end

  def create
    @event = current_user.events.new(event_params)

    if params[:back].present?
      render :new
      return
    end

    if @event.save
      EventMailer.creation_email(@event).deliver_now
      redirect_to @event, notice: "記事「#{@event.name}」を登録しました"
    else
      render :new
    end
  end

  def import
    current_user.events.import(params[:file])
    redirect_to events_url, notice: "記事を追加しました"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end
