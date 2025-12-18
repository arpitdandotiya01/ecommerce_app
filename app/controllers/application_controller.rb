class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private

  def user_not_authorized
    render plain: "You are not authorized to perform this action.", status: :forbidden
  end
end
