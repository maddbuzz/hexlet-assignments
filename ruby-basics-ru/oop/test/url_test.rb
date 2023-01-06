# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/url'

class UrlTest < Minitest::Test
  def setup
    @yandex_url = 'http://yandex.ru?key=value&key2=value2'
    @google_url = 'https://google.com:80?a=b&c=d&lala=value'
  end

  def test_yandex
    url = Url.new @yandex_url

    assert { url.scheme == 'http' }
    assert { url.host == 'yandex.ru' }

    params = { key: 'value', key2: 'value2' }

    assert { url.query_params == params }
    assert { url.query_param(:key) == 'value' }
    assert { url.query_param(:key2, 'lala') == 'value2' }
    assert { url.query_param(:new, 'ehu') == 'ehu' }
  end

  def test_yandex_without_query
    url = Url.new 'http://yandex.ru'

    assert { url.scheme == 'http' }
    assert { url.host == 'yandex.ru' }

    assert { url.query_params == {} }
    assert { url.query_param(:key).nil? }
    assert { url.query_param(:key2, 'lala') == 'lala' }
  end

  def test_yandex_equals?
    url = Url.new @yandex_url

    assert { Url.new(@yandex_url) == url }
    assert { Url.new(@google_url) != url }
  end

  def test_google
    url = Url.new @google_url

    assert { url.scheme == 'https' }
    assert { url.host == 'google.com' }

    params = { a: 'b', c: 'd', lala: 'value' }

    assert { params == url.query_params }
    assert { url.query_param(:key).nil? }
  end

  def test_google_equals?
    url = Url.new @google_url
    assert { url == Url.new(@google_url) }
    assert { url != Url.new('https://google.com') }
    assert { url != Url.new(@google_url.sub('80', '443')) }
  end
end
