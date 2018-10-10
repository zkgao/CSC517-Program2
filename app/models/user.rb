class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  enum role: [:realtor,:househunter, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
      if(self.id==1)
        self.role ||= :admin
      else
        self.role ||= :househunter
      end
  end
  def realtor?
    if ( companyid == nil )
      false
    else true
    end
   end
  def change_role
    if self.role == :househunter
      self.role ||= :realtor
    else
      self.role ||= :househunter
    end
  end
end