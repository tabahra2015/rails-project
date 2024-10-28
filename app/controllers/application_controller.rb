class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :home_page   # we use this way if we need to pass thing from the controller to  view ...  and this only for it's view not for all views   to kow what the action that work

  def home_page
    "home page tala"
  end


end
