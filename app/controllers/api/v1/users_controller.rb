module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_token, only: %i[destroy]
      before_action :admin?, only: %i[destroy]

      def create
        user = UserService.create_user!(JSON.parse(request.body.read))
        render json: { 'token': generate_jwt(user.id, user.username) }
      end

      def destroy
        user = User.find(params[:id])
        user.destroy!
        render json: {}
      end
    end
  end
end
