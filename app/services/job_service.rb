module JobService
  class << self
    def create_job!(user_id, req)
      attr = req['data']['attributes']
      job = Job.new(user_id: user_id, code: attr['code'])
      job = decorate_job(job, attr)
      job.save
    end

    private

    def decorate_job(job, attr)
      job.name = attr['name'] unless attr['name'].nil?
      job.description = attr['description'] unless attr['description'].nil?
      job.nb_splayds = attr['nb_splayds'] unless attr['nb_splayds'].nil? || attr['nb_splayds'] > Splayd.count
      job
    end
  end
end
