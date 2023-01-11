# frozen_string_literal: true

require 'test_helper'

EXPECTED_META = {
  city: 'Yekaterinburg',
  country: 'MORDOR',
  countryCode: 'RU',
  lat: '56.8439',
  lon: '60.6524'
}.freeze

class TestIpgeobase < TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def setup
    @test_ip = '83.169.216.199'
    @test_uri = Ipgeobase.get_request_uri(@test_ip)
    @stub =
      stub_request(:get, @test_uri)
      # .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: load_fixture('response.xml'), headers: {})
  end

  def test_lookup_http_query
    Ipgeobase.lookup(@test_ip)
    assert_requested @stub
  end

  def test_lookup_response_object
    ip_meta = Ipgeobase.lookup(@test_ip)
    assert { EXPECTED_META[:city] == ip_meta.city }
    assert { EXPECTED_META[:country] == ip_meta.country }
    assert { EXPECTED_META[:countryCode] == ip_meta.countryCode }
    assert { EXPECTED_META[:lat] == ip_meta.lat }
    assert { EXPECTED_META[:lon] == ip_meta.lon }
  end
end
