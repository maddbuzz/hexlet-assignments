# frozen_string_literal: true

require 'test_helper'

class TranslationTest < ActionDispatch::IntegrationTest
  test 'home#index en' do
    get root_path, headers: { HTTP_ACCEPT_LANGUAGE: 'en,ru;q=0.9,en-US;q=0.8' }

    assert_select 'h2', text: 'Home#index'
    assert_select 'strong', text: 'May the Force be with you!'
  end

  test 'home#index ru' do
    get root_path, headers: { HTTP_ACCEPT_LANGUAGE: 'ru,en;q=0.9,en-US;q=0.8' }

    assert_select 'h2', text: 'Домой#индекс'
    assert_select 'strong', text: 'Да пребудет с тобой Сила!'
  end
end
