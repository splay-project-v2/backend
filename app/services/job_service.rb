module JobService
  class << self
    def create_job!(user_id, req)
      job = Job.new(req['data']['attributes'])
      job.user_id = user_id
      job.save
      job
    end
  end
end
