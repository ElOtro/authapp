class CompaniesController < ApplicationController
	before_filter :deny_to_other
  before_action :set_company, only: [:edit, :addmember]

	def edit
		@member = Member.new
		@users = User.all
		@company_users = @company.users
	end

	def addmember
		user = User.find(params[:member][:user_id])
		@member = Member.new({ email: user.email, password: params[:member][:password], 
			                     password_confirmation: params[:member][:password_confirmation], 
			                     company_id: params[:member][:company_id], user_id: params[:member][:user_id] })
		respond_to do |format|
      if @member.save
        format.html { redirect_to edit_company_path(current_company), notice: 'Пользователь успешно создан.' }
        format.json { render :edit, status: :created, location: @member }
      else
        format.html { redirect_to edit_company_path(current_company), alert: 'Ошибка при создании пользователя.'}
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def deny_to_other
  		redirect_to root_path unless company_signed_in? or member_signed_in?
		end
end
