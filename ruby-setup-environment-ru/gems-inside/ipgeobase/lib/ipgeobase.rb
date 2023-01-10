# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'addressable/uri'
require 'addressable/template'
require 'net/http'
require 'happymapper'

module Ipgeobase
  class Error < StandardError; end

  class Address
    include HappyMapper
    tag 'query'
    element :city, String, tag: 'city'
    element :country, String, tag: 'country'
    element :countryCode, String, tag: 'countryCode'
    element :lat, String, tag: 'lat'
    element :lon, String, tag: 'lon'
  end

  def self.get_request_uri(target_ip)
    template = Addressable::Template.new('http://{host}{/segments*}')
    template.expand({ 'host' => 'ip-api.com', 'segments' => ['xml', target_ip] })
  end

  def self.lookup(target_ip)
    uri = get_request_uri(target_ip)
    xml = Net::HTTP.get(uri)
    Address.parse(xml)
  end
end
