class MenusController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  expose(:place) { Place.find(params[:place_id]) }
  expose(:menus) { place.menus.order(:position) }
  expose(:menu, attributes: :menu_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: MenusDatatable.new(view_context) }
    end
  end

  # POST /menus
  # POST /menus.json
  def create
    respond_to do |format|
      if menu.save
        format.html { redirect_to [place, menu], notice: 'Menu was successfully created.' }
        format.json { render json: [place, menu], status: ':created', location: menu }
      else
        format.html { render action: 'new' }
        format.json { render json: menu.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    respond_to do |format|
      if menu.update(menu_params)
        format.html { redirect_to [place, menu], notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: menu.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    menu.destroy

    respond_to do |format|
      format.html { redirect_to [place, :menus] }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:place_id, :name, :position, :description, :category => {}, :hours => [:day_of_week, :start_time, :end_time] )
    end
end
