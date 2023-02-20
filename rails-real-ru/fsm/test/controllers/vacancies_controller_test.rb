# frozen_string_literal: true

require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      title: Faker::Job.title,
      description: Faker::Lorem.sentence
    }
  end

  test 'should get index' do
    get vacancies_url
    assert_response :success
  end

  test 'should get new' do
    get new_vacancy_url
    assert_response :success
  end

  test 'should create vacancy' do
    post vacancies_url, params: { vacancy: @attrs }

    vacancy = Vacancy.find_by(@attrs)

    assert { vacancy }
    assert_redirected_to vacancies_url
  end

  test 'publish on moderate' do
    vacancy = vacancies(:on_moderate)

    patch publish_vacancy_path(vacancy)

    vacancy.reload

    assert { vacancy.published? }
    assert_redirected_to vacancies_url
  end

  test 'archive on moderate' do
    vacancy = vacancies(:on_moderate)

    patch archive_vacancy_path(vacancy)

    vacancy.reload

    assert { vacancy.archived? }
    assert_redirected_to vacancies_url
  end

  test 'archive published' do
    vacancy = vacancies(:published)

    patch archive_vacancy_path(vacancy)

    vacancy.reload

    assert { vacancy.archived? }
    assert_redirected_to vacancies_url
  end

  test 'refute publish archived' do
    vacancy = vacancies(:archived)

    patch publish_vacancy_path(vacancy)

    vacancy.reload

    assert { vacancy.archived? }
    assert_redirected_to vacancies_url
  end
end
