class RealEstateCompany < ApplicationRecord

  enum sizes: {
      '1~50' => 0,
      '51~200' => 1,
      '201~500' => 2,
      '501~1000' => 3,
      '1000+' => 4
  }
  validates :Size, inclusion: sizes.keys
end
