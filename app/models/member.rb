class Member < ActiveRecord::Base
	belongs_to :company
	belongs_to :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :authentication_keys => [:email, :company_id]

  def self.find_for_authentication(tainted_conditions)
    find_first_by_auth_conditions(tainted_conditions)
  end

end
