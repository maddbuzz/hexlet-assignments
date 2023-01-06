# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  def initialize(url)
    @uri = URI(url)
  end
  attr_reader :uri

  extend Forwardable
  def_delegators :uri, :scheme, :host

  include Comparable
  def <=>(other)
    uri <=> other.uri
  end

  def query_params
    query_string = uri.query
    return {} if query_string.nil?

    query_string
      .split('&')
      .to_h do |pair|
        k, v = pair.split('=')
        [k.to_sym, v]
      end
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end
end
# END
