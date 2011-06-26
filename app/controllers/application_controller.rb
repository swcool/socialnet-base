class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  protect_from_forgery
  include SessionsHelper
  
  helper_method :current_user
  helper_method :user_signed_in?

  private  
    def current_user  
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
    end
    
    def user_signed_in?
      return 1 if current_user 
    end
      
    def authenticate_user!
      if !current_user
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to signin_services_path
      end
    end
      
  protected
    def set_i18n_locale_from_params 
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym) 
            I18n.locale = params[:locale]
        else
            flash.now[:notice] = "#{params[:locale]} translation not available"
            logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options 
      { :locale => I18n.locale }
    end
end
