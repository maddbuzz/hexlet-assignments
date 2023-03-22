# frozen_string_literal: true

require 'octokit'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository_id)
    repository = Repository.find repository_id

    repository.fetch!

    client = Octokit::Client.new

    github_repo = Octokit::Repository.from_url(repository.link)

    github_data = client.repository(github_repo)

    repository.update!(
      repo_name: github_data[:name],
      owner_name: github_data[:owner][:login],
      description: github_data[:description],
      default_branch: github_data[:default_branch],
      watchers_count: github_data[:watchers_count],
      language: github_data[:language],
      repo_created_at: github_data[:created_at],
      repo_updated_at: github_data[:updated_at]
    )

    repository.mark_as_fetched
    repository.save!
  rescue StandardError
    repository.mark_as_failed!
  end
end
