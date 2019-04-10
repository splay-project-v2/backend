module LogService
  class << self
    def get_log(job_ref)
      log_file = File.open(Rails.root.join('log', 'splay', job_ref))
      content = log_file.read
      log_file.close
      content
    rescue Errno::ENOENT
      'Logs not available yet'
    end
  end
end
