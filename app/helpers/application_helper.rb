module ApplicationHelper
	def header(text)
  	content_for(:header) { text.to_s }
	end
	
	def sortable(column, title = nil, limit = nil, remote = true)  
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil   
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    hash_params = {}
    hash_params[:sort] = column
    hash_params[:direction] = direction
    hash_params[:page] = nil
    if column == sort_column
      link_to params.merge(hash_params), options = { :remote => remote, :class => css_class } do
        content_tag(:span, "#{title}") + content_tag("i", nil, class: "vert-align-fa pull-right fa fa-sort-#{direction} fa-lg")
      end
    else
      link_to title, params.merge(hash_params), options = { :remote => remote, :class => css_class }
    end
  end
end
