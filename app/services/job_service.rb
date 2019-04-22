module JobService
  class << self
    def create_job!(user_id, req)
      validate_splayds(req)
      job = Job.new(req['data']['attributes'])
      job.user_id = user_id
      job.ref = Digest::MD5.hexdigest(rand(1_000_000).to_s)
      job.save!
      job
    end

    private

    def validate_splayds(req)
      asked_splayds = req['data']['attributes']['nb_splayds'].to_i || 1
      raise BadRequest, 'Not enough Splayds available' if asked_splayds > Splayd.where(status: 'AVAILABLE').count
    end
  end

  class BadRequest < StandardError; end
end
