class SessionsController < Devise::SessionsController
    def respond_to_on_destroy
        respond_to do |format|
            format.all { head :no_content }
            format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: 303 } # ここで303statusを返します
        end
    end
    def destroy
        super
        redirect_to(new_user_session_path)
    end
end