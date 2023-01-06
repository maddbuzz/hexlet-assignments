# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  def initialize(url)
    @uri = URI(url)
    query_string = @uri.query || ''
    @query_params =
      query_string
      .split('&')
      .to_h do |pair|
        k, v = pair.split('=')
        [k.to_sym, v]
      end
  end
  attr_reader :uri, :query_params

  extend Forwardable
  def_delegators :uri, :scheme, :host

  include Comparable
  def <=>(other)
    uri <=> other.uri
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end
end
# END
