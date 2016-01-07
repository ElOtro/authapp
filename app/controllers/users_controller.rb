class UsersController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_user, only: [:edit]
	
	def edit
		@companies = @user.companies
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
