# frozen_string_literal: true

class CurrencyInput < SimpleForm::Inputs::Base
  def input(kwargs)
    options = merge_wrapper_options(input_html_options, kwargs)

    "#{@builder.text_field(attribute_name, options)} $".html_safe
  end
end
