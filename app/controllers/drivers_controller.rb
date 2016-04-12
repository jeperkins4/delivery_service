class DriversController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:drivers) {  Driver.all }
  expose(:driver, attributes: :driver_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: DriversDatatable.new(view_context) }
    end
  end

  # POST /drivers
  # POST /drivers.json
  def create
    respond_to do |format|
      if driver.save
        format.html { redirect_to driver, notice: 'Driver was successfully created.' }
        format.json { render json: driver, status: ':created', location: driver }
      else
        format.html { render action: 'new' }
        format.json { render json: driver.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.json
  def update
    respond_to do |format|
      if driver.update(driver_params)
        format.html { redirect_to driver, notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: driver.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    driver.destroy

    respond_to do |format|
      format.html { redirect_to drivers_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:user_id, :license, :state)
    end
end
