# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      hostname = 'https://rails-collective-blog-ru.hexlet.app/'
      reg_page_path = 'users/sign_up'
      reg_action_path = 'users'

      uri = URI(hostname)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new URI.join(hostname, reg_page_path)

      response = http.request request

      cookie = response.response['set-cookie'].split('; ')[0]

      params = {
        'user[email]': email,
        'user[password]': password,
        'user[password_confirmation]': password,
        authenticity_token: auth_token(response.body)
      }

      request = Net::HTTP::Post.new URI.join(hostname, reg_action_path)
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie

      response = http.request request

      response.code == '302'
    end

    private

    def auth_token(body)
      html = Nokogiri::HTML(body)

      html.at('input[@name="authenticity_token"]')['value']
    end
      
    # END
  end
end
