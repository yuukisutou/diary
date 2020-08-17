class NegativeEventsController < ApplicationController
  def new
    @negative_event = NegativeEvent.new
  end

  def create
    negative_event = NegativeEvent.new(negative_event_params)
    negative_event.save!
    redirect_to new_event_path, notice: "ポジティブに！"
  end

  private

  def negative_event_params
    params.require(:negative_event).permit(:name, :description)
  end
end
