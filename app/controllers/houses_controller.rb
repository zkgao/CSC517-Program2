class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :judge_realtor, except: [:index, :show]
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action
  # GET /houses
  # GET /houses.json


  def index
    @houses = House.all
    @houses.each do |house|
      house.contact_information_for_listing_realtor = User.find_by(id: house.contact_information_for_listing_realtor).email
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end


  # GET /houses/1
  # GET /houses/1.json
  def show
    @picture = Picture.find_by(house_id: @house.house_id)
    @inquiries = Inquiry.where(houseid: @house.house_id)
    @user_ids = @inquiries.select('userid')
    userids = Array.new(@user_ids.length)

    @user_ids.each do |id|
      userids.push(id.userid)
    end

    @users = User.find(userids)
    @house.contact_information_for_listing_realtor = User.find_by(id: @house.contact_information_for_listing_realtor).email
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/new
  def new
    @house = House.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
    #@house = House.find(params[:house_id])
    if current_user.id != @house.contact_information_for_listing_realtor
      respond_to do |format|
        format.html { redirect_to houses_url, notice: 'No access to edit this house!' }
      end

    end
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house.contact_information_for_listing_realtor = current_user.id

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render action :"new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    if current_user.id != @house.contact_information_for_listing_realtor
      respond_to do |format|
        format.html { redirect_to houses_url , notice: 'No access to update this house!' }
      end
    else
      respond_to do |format|
        if @house.update(house_params)
          format.html { redirect_to @house, notice: 'House was successfully updated.' }
          format.json { render :show, status: :ok, location: @house }
        else
          format.html { render :edit }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    #@house = House.find(params[:house_id])
    if current_user != User.find_by(id: @house.contact_information_for_listing_realtor)
      respond_to do |format|
        format.html { redirect_to houses_url , notice: 'No access to destroy this house!' }
      end
    else
      @house.destroy

      respond_to do |format|
        format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
        format.json { head :no_content }
      end

    end
  end

  # def potential_buyers
  #   if current_user.companyid != User.find_by(id: @house.contact_information_for_listing_realtor).companyid
  #     respond_to do |format|
  #       format.html { redirect_to @house , notice: 'No rights!' }
  #     end
  #   else
  #     @potential_buyers = Potential_buyers.select('buyer_id').where(house_id: params[:house_id])
  #   end
  # end

  def reply
    @house = House.find_by(house_id: params[:inquiry][:house_id])
    if current_user.companyid != User.find_by(id: @house.contact_information_for_listing_realtor).companyid
      respond_to do |format|
        format.html { redirect_to @house , notice: 'No access to reply!' }
      end
    else
      @inquiry = Inquiry.find(params[:inquiry][:id])
      respond_to do |format|
        if params[:inquiry][:reply] != ''
          @inquiry.update(inquiry_params)
        end
        format.html { redirect_to '/houses/' + @inquiry.houseid.to_s }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_house
    # @house = House.find(params[:id]
    @house=House.find_by(house_id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def house_params
    params.require(:house).permit(:house_id, :location, :square_footage, :year_built, :style, :list_price, :floors, :basement, :current_house_owner)
  end

  def inquiry_params
    params.require(:inquiry).permit(:id, :reply )
  end

  def judge_realtor
    if current_user.realtor? != true
      respond_to do |format|
        format.html { redirect_to '/users/edit' , notice: 'You should choose an existing real estate company before action.' }
      end
    end
  end

end
