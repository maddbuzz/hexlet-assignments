# frozen_string_literal: true

require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)

    @attrs = {
      manufacture: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      color: Faker::Vehicle.color,
      doors: Faker::Vehicle.doors,
      kilometrage: Faker::Vehicle.kilometrage,
      production_year: Faker::Date.backward,
      image: fixture_file_upload('hexlet.png', 'image/png')
    }
  end

  test 'should get index' do
    get vehicles_url
    assert_response :success
  end

  test 'should get new' do
    get new_vehicle_url
    assert_response :success
  end

  test 'should create vehicle' do
    post vehicles_url, params: { vehicle: @attrs }

    vehicle = Vehicle.find_by(@attrs.except(:image))

    assert { vehicle }
    assert_redirected_to vehicle_url(vehicle)
  end

  test 'should show vehicle' do
    get vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should get edit' do
    get edit_vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should update vehicle' do
    patch vehicle_url(@vehicle), params: { vehicle: @attrs }

    @vehicle.reload

    assert { @vehicle.manufacture == @attrs[:manufacture] }
    assert { @vehicle.model == @attrs[:model] }
    assert_redirected_to vehicle_url(@vehicle)
  end

  test 'should destroy vehicle' do
    delete vehicle_url(@vehicle)

    assert_redirected_to vehicles_url

    assert { !Vehicle.exists? @vehicle.id }
  end
end
