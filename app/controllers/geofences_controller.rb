class GeofencesController < ApplicationController
  def all
    @geofences = Geofence.all.order('id DESC')
  end

  def new
    @geofence = Geofence.new
  end

  def create
    @geofence = Geofence.new(geofence_params)
    if @geofence.save
      redirect_to @geofence, notice: 'Geofence successfully saved!'
    else
      render :new
    end
  end

  def show
    @geofence = Geofence.find(params[:id])
  end

  def edit
    @geofence = Geofence.find_by(id: params[:id])
  end

  def update
    @geofence = Geofence.find_by(id: params[:id])

    if @geofence.update(geofence_params)
      redirect_to @geofence, notice: 'Geofence successfully updated!'
    else
      render :edit
    end
  end

  private

  def geofence_params
    params.require(:geofence).permit(:description, :latitude,
                                     :longitude, :radius)
  end
end
