class Interest < ApplicationRecord
  after_initialize :inserttoptb
  def ptb
    PotentialBuyers.new(house_id: self.house_id, buyer_id: self.buyer_id)
  end
end
