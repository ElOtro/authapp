class HomeController < ApplicationController
	before_action :set_company, only: [:edit, :addmember]
  helper_method :sort_column, :sort_direction, :limit_page
	def index
		@sort = sort_column
    @direction = sort_direction
    @limit = limit_page
		@companies = Company.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:limit])
	end

	private
	
    def limit_page  
      params[:limit] || 20
    end     

    def sort_column  
      params[:sort] || "created_at"  
    end  

    def sort_direction  
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"  
    end
end
