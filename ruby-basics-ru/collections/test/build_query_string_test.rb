# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/build_query_string'

class BuildQueryStringTest < Minitest::Test
  def test_build_query_string
    assert { build_query_string({}) == '' }
    assert { build_query_string({ page: 1 }) == 'page=1' }
    assert { build_query_string({ per: 10, page: 1 }) == 'page=1&per=10' }
    assert { build_query_string({ a: 10, s: 'Wow', d: 3.2, z: '89' }) == 'a=10&d=3.2&s=Wow&z=89' }
    assert { build_query_string({ param: 'all', param1: true }) == 'param=all&param1=true' }
  end
end
