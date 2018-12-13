module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = AuthenticationService.authenticate!(JSON.parse(request.body.read))
        render json: { 'token': generate_jwt(user.id, user.email) }
      end
    end
  end
end
