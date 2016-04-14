class PlacesController < ApplicationController
  before_filter :authenticate_user!, exclude: [:index, :show]
  respond_to :html, :json

  expose(:places) { current_franchise.nil? ? Place.order(:name) : current_franchise.places.order(:name) }
  expose(:place, attributes: :place_params)

  autocomplete :place, :name

  def index
    respond_to do |format|
      format.html
      format.json { render json: PlacesDatatable.new(view_context) }
    end
  end

  # POST /places
  # POST /places.json
  def create
    respond_to do |format|
      if place.save
        format.html { redirect_to place, notice: 'Place was successfully created.' }
        format.json { render json: place, status: ':created', location: place }
      else
        format.html { render action: 'new' }
        format.json { render json: place.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    respond_to do |format|
      if place.update(place_params)
        format.html { redirect_to place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: place.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def place_params
      params.require(:place).permit(:name, :description, :street, :city, :state, :country, :postal_code, :latitude, :longitude, :hours, :phone, :email, :website, :factual_key, :category, :neighborhood, :position)
    end
end
