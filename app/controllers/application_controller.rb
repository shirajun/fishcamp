class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #configure_permitted_parametersメソッド。特定のカラムを許容するメソッド。ここはnameカラム追加の為nameキーの内容保存をpermitメソッドで許可
  end
end
