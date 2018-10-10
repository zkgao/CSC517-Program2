class PotentialBuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house


  def potential_buyers

    if current_user.companyid != User.find_by(id: @house.contact_information_for_listing_realtor).companyid
      respond_to do |format|
        format.html { redirect_to @house , notice: 'No access to see the list!' }
      end
    else
      @potential_buyer_ids = PotentialBuyers.where(house_id: params[:house_id]).select('buyer_id')
      potential_buyer_ids = Array.new(@potential_buyer_ids.length)
      @potential_buyer_ids.each do |id|
        potential_buyer_ids.push(id.buyer_id)
      end
      @users = User.find(potential_buyer_ids)
    end
  end


  private
  def set_house
    @house = House.find_by(house_id: params[:house_id].to_i)
  end

end






