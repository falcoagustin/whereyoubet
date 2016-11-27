  class CustomFailure < Devise::FailureApp
    def redirect_url
      new_user_session_url(:subdomain => 'secure')
    end

    def respond
      if http_auth?
        http_auth
      else
        if request.env['warden.options'][:action] == "unauthenticated" and request.env['HTTP_REFERER'].nil?
          raise "Unauthenticated"
        end

        flash[:login_error] = "Invalid email or password."
        redirect_to :back
      end
    end
  end
