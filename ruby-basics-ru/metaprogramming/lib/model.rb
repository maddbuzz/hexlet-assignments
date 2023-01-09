# frozen_string_literal: true

# BEGIN
module Model
  def initialize(initial_attributes = {})
    @attributes = {}
    self.class.attribute_options.each_pair do |name, options|
      value = initial_attributes.fetch(name, options.fetch(:default, nil))
      method("#{name}=").call(value)
    end
  end

  def self.included(base)
    base.attr_reader :attributes
    base.extend ClassMethods
  end

  module ClassMethods
    def attribute_options
      @attribute_options || {}
    end

    def attribute(attribute_name, options = {})
      @attribute_options ||= {}
      attribute_options[attribute_name] = options

      define_method :"#{attribute_name}" do
        @attributes[attribute_name]
      end

      define_method :"#{attribute_name}=" do |value|
        @attributes[attribute_name] = value_type_convert(value, options[:type])
      end
    end
  end
end

def value_type_convert(value, type)
  return nil if value.nil?

  case type
  when :datetime
    DateTime.parse value
  when :integer
    Integer value
  when :string
    String value
  when :boolean
    !!value
  else
    value
  end
end
# END
