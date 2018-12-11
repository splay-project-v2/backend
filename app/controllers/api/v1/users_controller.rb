module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = UserService.new(JSON.parse(request.body.read)).call
        render json: { 'token': user }
      end
    end
  end
end
