# frozen_string_literal: true

require 'test_helper'

module HexletCheck
  class RelationTest < ActiveSupport::TestCase
    test 'Task has associations' do
      reflect_associations = Task.reflect_on_all_associations(:belongs_to)

      associations = reflect_associations.map(&:name)

      assert associations.include?(:user)
      assert associations.include?(:status)
    end

    test 'User has associations' do
      reflect_associations = User.reflect_on_all_associations(:has_many)

      associations = reflect_associations.map(&:name)

      assert associations.include?(:tasks)
    end
  end
end
