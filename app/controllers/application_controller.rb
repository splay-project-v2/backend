class ApplicationController < ActionController::API
  include ActiveSupport::Rescuable

  rescue_from(ActiveRecord::RecordInvalid) { |e| render_error(:unprocessable_entity, e.to_s) }
  rescue_from(ActiveRecord::RecordNotFound) { |e| render_error(:not_found, e.to_s) }
  rescue_from(AuthenticationService::Unauthorized) { |e| render_error(:unauthorized, e.to_s) }
  rescue_from(JSON::ParserError) { render_error(:bad_request) }

  def generate_jwt(id, username)
    JWT.encode({ 'id': id, 'username': username }, Rails.application.credentials.jwt_secret, 'HS256')
  end

  def authenticate_token
    @current_user = AuthenticationService.authenticate_token!(request)
  end

  def admin?
    AuthenticationService.admin?(@current_user)
  end

  private

  def render_error(status, msg = nil)
    render json: { 'errors': msg }, status: status
  end
end
