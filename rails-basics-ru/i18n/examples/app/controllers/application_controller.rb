class ApplicationController < ActionController::Base
  around_action :set_locale_param

  private

  def default_url_options
    { locale: I18n.locale }
  end

  # Локаль может быть передана как в query param, так и в url
  # http://localhost:3000/users?locale=ru
  # http://localhost:3000/ru/users
  def set_locale_param(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_locale_param_with_cookie(&action)
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    cookies[:locale] = I18n.locale
  end

  def set_locale_domain(&action)
    # http://en.example.com
    # http://ru.example.com
    locale = request.subdomains.first

    I18n.locale = if I18n.available_locales.include?(locale.to_sym)
                    locale
                  else
                    I18n.default_locale
                  end
  end

  def set_locale_headers
    logger.debug(request.env['HTTP_ACCEPT_LANGUAGE'])
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

    logger.debug("LOCALE: #{locale}")

    I18n.locale = if I18n.available_locales.include?(locale.to_sym)
                    locale
                  else
                    I18n.default_locale
                  end
  end
end
