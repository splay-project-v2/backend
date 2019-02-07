module Api
  module V1
    class JobsController < ApplicationController
      before_action :authenticate_token, only: %i[index show]

      def index
        render json: {
          jobs: Job.all
        }
      end

      def show
        job = Job.find(params[:id])
        render json: {
          job: job
        }
      end
    end
  end
end
