# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repo = repositories :created

    @attrs = {
      link: 'https://github.com/github/github'
    }
  end

  test 'get index' do
    get repositories_url
    assert_response :success
  end

  test 'get new' do
    get new_repository_url
    assert_response :success
  end

  test 'create' do
    post repositories_url, params: { repository: @attrs }

    repository = Repository.find_by @attrs

    assert { repository }
    assert_redirected_to repository_url(repository)

    assert_enqueued_with job: RepositoryLoaderJob
  end

  test 'update' do
    patch repository_url(@repo)

    assert_redirected_to repositories_url
    assert_enqueued_with job: RepositoryLoaderJob
  end

  test 'destroy' do
    delete repository_url(@repo)

    assert_redirected_to repositories_url
    refute { Repository.exists? @repo.id }
  end

  test 'update_repos' do
    patch update_repos_repositories_url

    assert_redirected_to repositories_url
    assert_enqueued_with job: RepositoryLoaderJob
  end
end
