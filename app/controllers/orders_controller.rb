class OrdersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  expose(:orders) {  Order.all }
  expose(:order, attributes: :order_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    respond_to do |format|
      if order.save
        format.html { redirect_to order, notice: 'Order was successfully created.' }
        format.json { render json: order, status: ':created', location: order }
      else
        format.html { render action: 'new' }
        format.json { render json: order.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    respond_to do |format|
      if order.update(order_params)
        format.html { redirect_to order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: order.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :place_id, :status, :placed_at, :pickup_at, :delivered_at, :rating, :street, :city, :state, :postal_code, :phone, :driver_id)
    end
end
