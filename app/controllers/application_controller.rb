class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  private

  def after_sign_out_path_for(resource_or_scope)
    books_path
  end
end