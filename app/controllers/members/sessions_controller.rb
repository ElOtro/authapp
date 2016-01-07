class Members::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @company = Company.find(params[:company_id])
    @email = params[:email]
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :company_id])
    devise_parameter_sanitizer.for(:sign_up).push(:company_id, :user_id)
  end
end
