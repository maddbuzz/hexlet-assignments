# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'net/https'

uri = URI('https://httpbin.org')
get_path = '/get'
post_path = '/post'

Net::HTTP.start(uri.host, uri.port,
                use_ssl: uri.scheme == 'https',
                verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
  request = Net::HTTP::Get.new uri.request_uri + get_path

  response = http.request request

  puts response.body

  # cookie = response.response['set-cookie'].split('; ')[0]

  params = {
    test: true,
    hello: 'world'
  }

  request = Net::HTTP::Post.new uri.request_uri + post_path
  request.body = URI.encode_www_form(params)
  # request['Cookie'] = cookie

  response = http.request request

  puts response.body

  response.code == '200'
end

# Пример с получением страницы
hostname = 'https://example.com'

uri = URI(hostname)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = uri.scheme == 'https'
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new uri

response = http.request request

# Если нам нужно получить куки со страницы
cookie = response.response['set-cookie'].split('; ')[0]

params = {
  'name': "Jon",
  'email': "jon@example.com"
  'token': token
}

request = Net::HTTP::Post.new URI.join(hostname, '/register')
request.body = URI.encode_www_form(params)
# Добавляем куки в запрос
request['Cookie'] = cookie

response = http.request request

# При успешной отправке формы как правило
response.code == '302'

# Пример скрапинга данных со страницы
example_uri = URI('https://example.com/')
response = Net::HTTP.get_response(example_uri)

html = Nokogiri::HTML(response.body)
# Поиск нужного тега с помощью селекторов
token_tag = html.at('input[@name="token"]')
puts token_tag['value']
