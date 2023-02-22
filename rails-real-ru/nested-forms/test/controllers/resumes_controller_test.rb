# frozen_string_literal: true

require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resume = resumes(:one)

    @attrs = {
      name: Faker::Name.name,
      contact: Faker::PhoneNumber.phone_number,
      educations_attributes: {
        '0': {
          institution: Faker::Educator.university,
          faculty: Faker::Educator.degree,
          begin_date: Faker::Date.backward
        }
      },
      works_attributes: {
        '0': {
          company: Faker::Company.name,
          begin_date: Faker::Date.backward
        }
      }
    }
  end

  test 'should get index' do
    get resumes_url
    assert_response :success
  end

  test 'should get new' do
    get new_resume_url
    assert_response :success
  end

  test 'should create resume' do
    post resumes_url, params: { resume: @attrs }

    resume = Resume.find_by name: @attrs[:name]

    assert { resume }
    assert_redirected_to resume_url(resume)
  end

  test 'should show resume' do
    get resume_url(@resume)
    assert_response :success
  end

  test 'should get edit' do
    get edit_resume_url(@resume)
    assert_response :success
  end

  test 'should update resume' do
    patch resume_url(@resume), params: { resume: @attrs }

    @resume.reload

    assert { @resume.name == @attrs[:name] }
    assert_redirected_to resume_url(@resume)
  end

  test 'should destroy resume' do
    delete resume_url(@resume)

    assert { !Resume.exists? @resume.id }

    assert_redirected_to resumes_url
  end
end
