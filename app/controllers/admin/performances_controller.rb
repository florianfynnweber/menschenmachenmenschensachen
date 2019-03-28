# frozen_string_literal: true

class Admin::PerformancesController < ApplicationController
  before_action :authenticate_user!
  layout "adminDash"

  def index
    @performances = Performance.all
  end

  def new
    @performance = Performance.new
    @locations = Location.getLocationsNames
  end

  def create
    @perLoc = PerformanceLocation.new
    @perLoc.location_id = Location.find_by_name(performance_params[:location]).id
    p "dslkjslkfjödsjflksjfölksdjfölksjdfölksj"
    p performance_params
    @performance = Performance.new(performance_params.except(:location).except(:event_id))
    @locations = Location.getLocationsNames
    if @performance.save
      eventPer = PerformanceEvent.new(event_id: session[:tmp_event_id], performance_id: @performance.id)
      @perLoc.performance_id = @performance.id
      if @perLoc.save && eventPer.save
        Ticket.createTicketsForPerformance(@performance, current_user.id)
        redirect_to(admin_event_path(session[:tmp_event_id]))
      else
        flash[:error] = "sth went wrong"
      end
    else
      render :new
    end
  end

  def edit
    @performance = Performance.find(params[:id])
    @locations = Location.getLocationsNames
  end

  def update
    @perLoc = PerformanceLocation.find_by(performance_id: params[:id])
    @perLoc.location_id = Location.find_by_name(performance_params[:location]).id
    @performance = Performance.find(params[:id])
    if @performance.update(performance_params.except(:location).except(:event_id)) && @perLoc.save
      flash[:success] = "performances was edited successful"
      redirect_to(admin_event_path(session[:tmp_event_id]))
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_performance_path(params[:id]))
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    if @performance.destroy
      flash[:success] = "performances was destroyed successful"
      redirect_to admin_performances_path
    else
      flash[:danger] = "Something went wrong "
    end
  end

  def show
    @performance = Performance.find(params[:id])
  end

  private

    begin
      def performance_params
        params.require(:performance).permit(:start,
                                            :stop,
                                            :prize,
                                            :sell_allowed,
                                            :stop_selling,
                                            :number_of_tickets,
                                            :location,
                                            :changed_by,
                                            :event_id
        )
      end
    end
end
