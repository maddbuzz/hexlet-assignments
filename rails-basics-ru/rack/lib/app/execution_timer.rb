# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    time_start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    status, headers, body = @app.call(env)
    time_finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed_microseconds = (time_finish - time_start) * 1_000_000
    body << '</br>'
    body << "Request execution time: #{elapsed_microseconds.to_i} us\n"
    [status, headers, body]
    # END
  end
end
