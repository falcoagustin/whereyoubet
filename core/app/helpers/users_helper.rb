module UsersHelper
    def restrict_user_access
        if not current_user.is_admin_user
            raise "Authentication failed."
        end
    end
end
