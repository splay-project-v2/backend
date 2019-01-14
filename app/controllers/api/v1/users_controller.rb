module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = UserService.create_user!(JSON.parse(request.body.read))
        render json: { 'token': generate_jwt(user.id, user.login) }
      end
    end
  end
end
