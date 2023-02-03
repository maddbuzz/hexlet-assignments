# frozen_string_literal: true

require 'test_helper'
require 'rake'

class ImportUsersTest < ActiveSupport::TestCase
  def setup
    App::Application.load_tasks if Rake::Task.tasks.empty?
  end

  test 'import users' do
    test_dir_path = File.dirname(__FILE__, 2)
    path = File.join test_dir_path, 'fixtures/files/users.csv'

    # FIXME: use find_by instead of assert difference
    assert_difference('User.count', +100) do
      Rake::Task['hexlet:import_users'].invoke(path)
    end
  end
end
