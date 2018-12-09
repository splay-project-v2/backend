class Api::V1::UsersController < ApplicationController
  def create
    render json: {'foo': 'bar'}
  end
end