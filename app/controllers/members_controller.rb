class MembersController < ApplicationController
	before_filter :authenticate_member!
  before_action :set_member, only: [:edit]
	def edit
		
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit( :user_id, :email, :password, :password_confirmation, :company_id )
    end
end