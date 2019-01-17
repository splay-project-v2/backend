class ApplicationController < ActionController::API
  include ActiveSupport::Rescuable

  rescue_from(ActiveRecord::RecordInvalid) { |e| render_error(:unprocessable_entity, e.to_s) }
  rescue_from(ActiveRecord::RecordNotFound) { |e| render_error(:not_found, e.to_s) }
  rescue_from(AuthenticationService::Unauthorized) { |e| render_error(:unauthorized, e.to_s) }

  def generate_jwt(id, username)
    JWT.encode({ 'id': id, 'username': username }, Rails.application.credentials.jwt_secret, 'HS256')
  end

  private

  def render_error(status, msg = nil)
    render json: { 'errors': msg }, status: status
  end
end
