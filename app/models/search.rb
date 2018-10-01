class Search < ApplicationRecord
  def find_houses
    houses=House.all
    houses=houses.where(companyid: companyid) if companyid.present?
    houses=houses.where(yearbuilt: yearbuilt) if yearbuilt.present?
    houses=houses.where("price >= ?", minprice) if minprice.present?
    houses = houses.where("price <= ?", maxprice) if maxprice.present?
    houses=houses.where("price >= ?", minsquare) if minsquare.present?
    houses = houses.where("price <= ?", maxsquare) if maxsquare.present?
    houses
  end
end
