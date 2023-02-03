# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    request = Rack::Request.new env

    Rails.logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"

    locale = extract_locale_from_accept_language_header(request) || I18n.default_locale

    Rails.logger.debug "* Locale set to '#{locale}'"
    I18n.locale = locale.downcase.to_sym

    @app.call env
  end

  def extract_locale_from_accept_language_header(request)
    locale = request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first

    Rails.logger.debug "* Local detected as '#{locale}'"

    I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
  end
  # END
end
