# frozen_string_literal: true

# Gemfile
# https://github.com/heartcombo/simple_form
gem 'simple_form'

# Создание своего инпута
# app/inputs/currency_input.rb
class CurrencyInput < SimpleForm::Inputs::Base
  def input(kwargs)
    options = merge_wrapper_options(input_html_options, kwargs)

    "#{@builder.text_field(attribute_name, options)} $".html_safe
  end
end

# После установки simple_form можно кастомизировать в инициалайзере
# config/initializers/simple_form.rb
SimpleForm.setup do |config|
  config.wrappers :default, class: :input,
                            hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|
    ## Extensions enabled by default
    # Any of these extensions can be disabled for a
    # given input by passing: `f.input EXTENSION_NAME => false`.
    # You can make any of these extensions optional by
    # renaming `b.use` to `b.optional`.

    # Determines whether to use HTML5 (:email, :url, ...)
    # and required attributes
    b.use :html5

    # Calculates placeholders automatically from I18n
    # You can also pass a string as f.input placeholder: "Placeholder"
    b.use :placeholder

    ## Optional extensions
    # They are disabled unless you pass `f.input EXTENSION_NAME => true`
    # to the input. If so, they will retrieve the values from the model
    # if any exists. If you want to enable any of those
    # extensions by default, you can change `b.optional` to `b.use`.

    # Calculates maxlength from length validations for string inputs
    # and/or database column lengths
    b.optional :maxlength

    # Calculate minlength from length validations for string inputs
    b.optional :minlength

    # Calculates pattern from format validations for string inputs
    b.optional :pattern

    # Calculates min and max from length validations for numeric inputs
    b.optional :min_max

    # Calculates readonly automatically from readonly attributes
    b.optional :readonly

    ## Inputs
    # b.use :input, class: 'input', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :label_input
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end
  config.default_wrapper = :default
  config.boolean_style = :nested

  # Default class for buttons
  config.button_class = 'btn'
  config.error_notification_tag = :div

  # CSS class to add for error notification helper.
  config.error_notification_class = 'error_notification'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end
