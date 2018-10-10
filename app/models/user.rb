class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  enum roles: {
      'realtor' => 'realtor',
      'househunter' => 'house_hunter'
  }
  validates :role, inclusion: roles.keys
end