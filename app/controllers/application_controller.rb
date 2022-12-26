class ApplicationController < ActionController::Base
    before_action :set_locale
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end
    def after_sign_out_path_for(resource)
        tweets_path
    end
end
