module Api
  module V1
    class LogsController < ApplicationController
      before_action :authenticate_token, only: [:show]

      def show
        job = Job.find(params[:id])
        render json: {
          logs: LogService.get_log(job.ref)
        }
      end
    end
  end
end
