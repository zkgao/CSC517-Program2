class AdminController < ApplicationController


  def new
  end

  def create
    super
  end

  def update
    respond_to do |format|
      if @admin.update(user_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin}
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:admin).permit(:Id, :Name, :email)
  end
end
