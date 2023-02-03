# frozen_string_literal: true

class RequestTimeLogger
  attr_reader :app, :logger_indentificator

  def initialize(app, logger_indentificator = '*')
    @app = app
    @logger_indentificator = logger_indentificator
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    request_recieved_at = Time.now
    @status, @headers, @response = @app.call(env)
    request_handled_at = Time.now

    beauty_logging(request_handled_at - request_recieved_at)

    [@status, @headers, @response]
  end

  private

  def beauty_logging(time)
    Rails.logger.debug(logger_indentificator * 50)
    Rails.logger.debug("Request time: #{time}")
    Rails.logger.debug(logger_indentificator * 50)
  end
end
