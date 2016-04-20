class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:menu) { Menu.find(params[:menu_id]) }
  expose(:place) { menu.place || Place.find(params[:place_id]) }
  expose(:items) {  Item.all }
  expose(:item, attributes: :item_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: ItemsDatatable.new(view_context) }
    end
  end

  # POST /items
  # POST /items.json
  def create
    respond_to do |format|
      if item.save
        format.html { redirect_to [place, menu, item], notice: 'Item was successfully created.' }
        format.json { render json: [place, menu, item], status: ':created', location: item }
      else
        format.html { render action: 'new' }
        format.json { render json: item.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    respond_to do |format|
      if item.update(item_params)
        format.html { redirect_to [place, menu, item], notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: item.errors, status: ':unprocessable_entity' }
      end
    end
  end

  def order
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:menu_id, :name, :description, :position, :price, :estimated_prep_time)
    end
end
