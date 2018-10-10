class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:show, :edit, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.where(house_id: params[:format])
    @house = House.find_by(house_id: params[:format])
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show

  end

  # GET /pictures/new
  def new
    if is_this_realtor(params[:format])
      @picture = Picture.new
      @house = House.find_by(house_id: params[:format])
    else
      redirect_to '/pictures.' + params[:format], notice: 'No access to add picture.'
    end
  end

  # GET /pictures/1/edit

  # POST /pictures
  # POST /pictures.json
  def create
    if is_this_realtor(params[:picture][:house_id])
      @picture = Picture.new(picture_params)
      if @picture.picture_url != nil
        respond_to do |format|
          if @picture.save
            format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
            format.json { render :show, status: :created, location: @picture }
          else
            format.html { render :new }
            format.json { render json: @picture.errors, status: :unprocessable_entity }

          end
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to houses_url , notice: 'No access to create picture!' }
      end
    end

  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json


  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    house_id = @picture.house_id
    url = '/pictures.' + house_id.to_s
    if is_this_realtor(house_id)
      @picture.destroy

      respond_to do |format|
        format.html { redirect_to url, notice: 'Picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to url, notice: 'No access to delete this picture!' }
      end
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    params.require(:picture).permit(:house_id, :picture_url)
  end

  def is_this_realtor(houseid)
    house = House.find_by(house_id: houseid)
    companyid = User.find_by(id: house.contact_information_for_listing_realtor).companyid
    if current_user.companyid != companyid
      return false
    else true
    end
  end

end
