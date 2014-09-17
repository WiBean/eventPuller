class WibeanEventsController < ApplicationController

  def index
    @grid = WibeanEventsGrid.new(params[:wibean_events_grid]) do |scope|
      scope.page(params[:page])
    end
  end

end

