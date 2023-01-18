# frozen_string_literal: true

require 'test_helper'
require_relative '../controllers/bulletins_controller_test'

class HexletCheckTest < ActiveSupport::TestCase
  test 'BulletinsControllerTest exists and has methods' do
    assert defined? BulletinsControllerTest
    test_methods = BulletinsControllerTest.new({}).methods.select { |method| method.start_with? 'test_' }

    assert { test_methods.any? }
  end

  test 'Bulletins fixtures not empty' do
    assert { Bulletin.all.any? }
  end
end
