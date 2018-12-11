module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = UserService.new(JSON.parse(request.body.read)).create_user!
        render json: { 'token': generate_jwt(user.id, user.email) }
      end
    end
  end
end
