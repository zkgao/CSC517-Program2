class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      adminmanage_url
    else
      super
    end
  end
end
