class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = 'f90da6ae866601ebea190c9345798d8c5e233629b6e5f68b07022084439099d9b45fc31160172715e6e3d3f13d96c1e619720856c00541522f513f5702c55dd2'
  protected
  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
	books_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    home_path # ログアウト後に遷移するpathを設定
  end

end
