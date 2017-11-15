class FranchisesController < ApplicationController
  before_action :authenticate_user!, except: [:set_location]
  respond_to :html, :json

  expose(:franchises) {  Franchise.all }
  expose(:franchise, attributes: :franchise_params)

  autocomplete :franchise, :location

  def index
    respond_to do |format|
      format.html
      format.json { render json: FranchisesDatatable.new(view_context) }
    end
  end

  def create
    respond_to do |format|
      if franchise.save
        format.html { redirect_to franchise, notice: 'Franchise was successfully created.' }
        format.json { render json: franchise, status: ':created', location: franchise }
      else
        format.html { render action: 'new' }
        format.json { render json: franchise.errors, status: ':unprocessable_entity' }
      end
    end
  end

  def update
    respond_to do |format|
      if franchise.update(franchise_params)
        format.html { redirect_to franchise, notice: 'Franchise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: franchise.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /franchises/1
  # DELETE /franchises/1.json
  def destroy
    franchise.destroy

    respond_to do |format|
      format.html { redirect_to franchises_url }
      format.json { head :no_content }
    end
  end

  def set_location
  end

  private
    # Only allow a trusted parameter "white list" through.
    def franchise_params
      params.require(:franchise).permit(:name, :merchant_key, :location, :latitude, :longitude)
    end
end
