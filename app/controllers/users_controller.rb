class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:users) {  User.all }
  expose(:user, attributes: :user_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      if user.save
        format.html { redirect_to user, notice: 'User was successfully created.' }
        format.json { render json: user, status: ':created', location: user }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if user.update(user_params)
        format.html { redirect_to user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: user.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :time_zone, :franchise_id, role_ids: [])
    end
end
