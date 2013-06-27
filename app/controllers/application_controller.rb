class ApplicationController < ActionController::Base
  protect_from_forgery

    private

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def after_sign_in_path_for(resource)
      @user = current_user
      if @user.act
        act_path(@user.act.id)
      else
        root_path
      end
    end

end
