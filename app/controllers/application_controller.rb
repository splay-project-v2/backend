class ApplicationController < ActionController::API
  include ActiveSupport::Rescuable

  rescue_from ActiveRecord::RecordInvalid do |e| render_unprocessable(e.to_s) end

  private

  def render_unprocessable(msg = nil)
    render json: {'errors': msg}, status: :unprocessable_entity
  end
end
