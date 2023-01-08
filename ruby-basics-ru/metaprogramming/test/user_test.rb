# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/user'

class UserTest < Minitest::Test
  def test_user
    user = User.new name: 'Dima', birthday: '01-2-1890'

    assert_equal 'Dima', user.name
    refute user.active
    assert_equal DateTime.parse('01-2-1890'), user.birthday
    assert_instance_of(DateTime, user.birthday)

    assert_equal ({ name: 'Dima', birthday: DateTime.parse('01-2-1890'), active: false }), user.attributes
  end

  def test_extra_attributes
    user1 = User.new name: 'Test', birthday: nil

    assert_equal({ name: 'Test', birthday: nil, active: false }, user1.attributes)
  end

  def test_set_nil_attribute
    user = User.new
    user.name = nil

    assert_nil user.name
  end

  def test_multiple_users_are_differents
    user1 = User.new
    user1.name = 'Kolya'

    user2 = User.new
    user2.name = 'Vasya'

    assert_equal 'Kolya', user1.name
    assert_equal 'Vasya', user2.name
  end

  def test_user_attribute_accesssors
    user = User.new

    user.name = 'Kolya'
    user.birthday = '01/01/1970'
    user.active = true

    assert_equal 'Kolya', user.name
    assert_equal DateTime.parse('01/01/1970'), user.birthday
    assert user.active
    assert_equal ({ name: 'Kolya', birthday: DateTime.parse('01/01/1970'), active: true }), user.attributes
  end

  def test_defaults
    user = User.new

    assert_equal 'Andrey', user.name
    assert_equal ({ name: 'Andrey', birthday: nil, active: false }), user.attributes
  end
end
