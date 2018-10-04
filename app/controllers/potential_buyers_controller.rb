class PotentialBuyersController < ApplicationController

  def potential_buyers
    @potential_buyer_ids = PotentialBuyers.where(house_id: params[:house_id]).select('buyer_id')
    potential_buyer_ids = Array.new(@potential_buyer_ids.length)
    @potential_buyer_ids.each do |id|
      potential_buyer_ids.push(id.buyer_id)
    end
    @users = User.find(potential_buyer_ids)
  end

end
