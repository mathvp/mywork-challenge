class TimetracksController < ApplicationController
  def all
    @timetracks = Timetrack.all.order('id DESC')
  end

  def new
    @timetrack = Timetrack.new(timetrack_params)
    @geofences = Geofence.check_timetrack_location(@timetrack)

    error_msg = 'It doesn\'t have any Geofence near you...'
    @timetrack.errors.add(:base, error_msg) if @geofences.size.zero?
  end

  def show
    redirect_to location_timetracks_path unless params[:latitude] &&
                                                params[:longitude]
    @timetrack = Timetrack.find_by(id: params[:id])
  end

  def location; end

  def register_location; end

  def create
    @timetrack = Timetrack.new(timetrack_params)
    if @timetrack.save
      redirect_to @timetrack, notice: 'Timetrack successfully saved!'
    else
      @geofences = Geofence.all
      render :new
    end
  end

  private

  def timetrack_params
    params.require(:timetrack).permit(:geofence_id, :user, :comment,
                                      :latitude, :longitude)
  end
end
