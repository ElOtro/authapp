class Member < ActiveRecord::Base
	belongs_to :company
	belongs_to :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :authentication_keys => [:email, :company_id]
  validates_uniqueness_of   :email, scope: [:company_id]
	validates_presence_of     :password, if: :password_required?
 	validates_confirmation_of :password, if: :password_required?
 	validates_length_of       :password, within: 7..72, allow_blank: true

  def self.find_for_authentication(tainted_conditions)
    find_first_by_auth_conditions(tainted_conditions)
  end

  protected
    # Checks whether a password is needed or not. For validations only.
    # Passwords are always required if it's a new record, or if the password
    # or confirmation are being set somewhere.
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end

    def email_required?
      true
    end
end
