module Api
  module V1
    class SplaydsController < ApplicationController
      before_action :authenticate_token, only: [:index]

      def index
        render json: {
          splayds: Splayd.all
        }
      end
    end
  end
end
