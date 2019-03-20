module Api
  module V1
    class JobsController < ApplicationController
      before_action :authenticate_token, only: [:index, :show, :destroy, :create]

      def index
        render json: {
          jobs: Job.all
        }
      end

      def create
        job = JobService.create_job!(@current_user.id, JSON.parse(request.body.read))
        render json: {
          job: job
        }
      end

      def show
        job = Job.find(params[:id])
        render json: {
          job: job.as_json.merge(host_list: job.hosts)
        }
      end

      def destroy
        job = Job.find(params[:id])
        job.update('command': 'KILL')
        render json: ''
      end
    end
  end
end
