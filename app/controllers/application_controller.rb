class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top] 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @post = Post.new
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
      posts_path
  end
    
end
