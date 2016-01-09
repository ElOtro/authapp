class HomeController < ApplicationController
	before_action :set_company, only: [:edit, :addmember]
  helper_method :sort_column, :sort_direction, :limit_page
	def index
		@sort = sort_column
    @direction = sort_direction
    @limit = limit_page
    if params[:category_id].present?
    	category_ids = []
    	category = Category.find(params[:category_id])
    	if category.children.any?
    		category_ids.concat(category.children)
    	else
    		category_ids << params[:category_id]
    	end
    	@companies = Company.where('category_id IN (?)', category_ids)
    else
    	@companies = Company.all
    end
    @companies = @companies.includes(:category).order(sort_column + ' ' + sort_direction).page(params[:page]).per(@limit)
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
