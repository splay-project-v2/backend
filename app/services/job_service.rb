module JobService
  class << self
    def create_job!(user_id, req)
      job = Job.new(req['data']['attributes'])
      job.user_id = user_id
      job.ref = Digest::MD5.hexdigest(rand(1_000_000).to_s)
      job.save
      job
    end
  end
end
