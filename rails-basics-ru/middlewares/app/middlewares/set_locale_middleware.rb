# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    switch_locale(env)
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

  def switch_locale(env)
    accept_language_header = env['HTTP_ACCEPT_LANGUAGE']
    Rails.logger.debug "* Accept-Language: #{accept_language_header}"
    locale = extract_locale_from_accept_language_header(accept_language_header)
    Rails.logger.debug "* Locale set to '#{locale}'"
    I18n.locale = locale
  end

  private

  def extract_locale_from_accept_language_header(accept_language_header)
    return I18n.default_locale if accept_language_header.nil?

    accept_language_header.scan(/^[a-z]{2}/).first
  end
  # END
end
