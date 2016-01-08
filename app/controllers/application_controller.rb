class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  
  # Overwriting the sign_in redirect path method
	def after_sign_in_path_for(resource_or_scope)
    if user_signed_in? && resource_or_scope.class == User
      edit_user_path(current_user)
    elsif member_signed_in? && resource_or_scope.class == Member
      edit_company_path(current_member.company_id)
    elsif company_signed_in? && resource_or_scope.class == Company
      edit_company_path(current_company)
    end
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_locale
    browser_locale = extract_locale_from_accept_language_header
    if I18n.available_locales.include? browser_locale.to_sym
      I18n.locale = browser_locale
    else
      I18n.default_locale
    end
  end 

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

end
