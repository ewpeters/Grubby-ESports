module Delayed
  class Worker
    alias_method :original_handle_failed_job, :handle_failed_job
    protected
    def handle_failed_job(job, error)
      say "Error Intercepted by Exceptional..."
      Exceptional.handle(error, "Delayed Job Exception")
      original_handle_failed_job(job, error)
    end
  end
end