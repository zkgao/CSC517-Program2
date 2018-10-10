class Search < ApplicationRecord
  def find_houses
    houses=House.all
    houses=houses.where(year_built: yearbuilt) if yearbuilt.present?
    houses=houses.where("price >= ?", minprice) if minprice.present?
    houses = houses.where("price <= ?", maxprice) if maxprice.present?
    houses=houses.where("square_footage >= ?", minsquare) if minsquare.present?
    houses = houses.where("square_footage <= ?", maxsquare) if maxsquare.present?
    houses
  end
end
