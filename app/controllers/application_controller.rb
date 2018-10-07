class ApplicationController < ActionController::Base
  def directbyrole
    unless current_user.get_role=='admin'
      redirect_to show_users_path(current.id)
    end
  end
end
