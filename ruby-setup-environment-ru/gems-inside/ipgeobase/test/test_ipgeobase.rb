# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/ipgeobase'

MOCK_RESPONSE = "HTTP/1.1 200 OK
Date: Tue, 10 Jan 2023 11:46:50 GMT
Content-Type: application/xml; charset=utf-8
Content-Length: 477
Access-Control-Allow-Origin: *
X-Ttl: 60
X-Rl: 44

<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<query>
  <status>success</status>
  <country>MORDOR</country>
  <countryCode>RU</countryCode>
  <region>SVE</region>
  <regionName>Sverdlovsk Oblast</regionName>
  <city>Yekaterinburg</city>
  <zip>620042</zip>
  <lat>56.8439</lat>
  <lon>60.6524</lon>
  <timezone>Asia/Yekaterinburg</timezone>
  <isp>PJSC MegaFon</isp>
  <org>PJSC MegaFon GPRS/UMTS Network</org>
  <as>AS31224 PJSC MegaFon</as>
  <query>83.169.216.199</query>
</query>"

EXPECTED_META = {
  city: 'Yekaterinburg',
  country: 'MORDOR',
  countryCode: 'RU',
  lat: '56.8439',
  lon: '60.6524'
}.freeze

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def setup
    @test_ip = '83.169.216.199'
    @test_uri = Ipgeobase.get_request_uri(@test_ip)
    stub_request(:get, @test_uri).to_return(MOCK_RESPONSE)
  end

  def test_ipgeobase
    ip_meta = Ipgeobase.lookup(@test_ip)
    assert { EXPECTED_META[:city] == ip_meta.city }
    assert { EXPECTED_META[:country] == ip_meta.country }
    assert { EXPECTED_META[:countryCode] == ip_meta.countryCode }
    assert { EXPECTED_META[:lat] == ip_meta.lat }
    assert { EXPECTED_META[:lon] == ip_meta.lon }
  end
end
