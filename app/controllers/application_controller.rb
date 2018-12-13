class ApplicationController < ActionController::API
  include ActiveSupport::Rescuable

  rescue_from ActiveRecord::RecordInvalid do |e| render_error(e.to_s, :unprocessable_entity) end
  rescue_from ActiveRecord::RecordNotFound do |e| render_error(e.to_s, :not_found) end
  rescue_from AuthenticationService::Unauthorized do |e| render_error(e.to_s, :unauthorized) end

  def generate_jwt(id, email)
    JWT.encode({'id': id, 'email': email}, Rails.application.credentials.jwt_secret, 'HS256')
  end

  private

  def render_error(msg = nil, status)
    render json: {'errors': msg}, status: status
  end
end
