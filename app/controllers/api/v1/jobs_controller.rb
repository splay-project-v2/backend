module Api
  module V1
    class JobsController < ApplicationController
      before_action :authenticate_token, only: %i[index show destroy]

      def index
        render json: {
          jobs: Job.all
        }
      end

      def create
        user = authenticate_token
        job = JobService.create_job!(user.id, JSON.parse(request.body.read))
        render json: {
          job: job
        }
      end

      def show
        job = Job.find(params[:id])
        render json: {
          job: job
        }
      end

      def destroy
        job = Job.find(params[:id])
        job.destroy!
        render json: ''
      end
    end
  end
end
