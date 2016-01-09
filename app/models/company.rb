class Company < ActiveRecord::Base
	belongs_to :category
	has_many :members
	has_many :users, through: :members
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
