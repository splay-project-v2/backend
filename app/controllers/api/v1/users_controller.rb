class Api::V1::UsersController < ApplicationController
  def create
    user = UserService.new(JSON.parse request.body.read).call
    render json: {'token': user}
  end
end